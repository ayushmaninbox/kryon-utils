// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

// Generates all icon assets from the official artwork:
// - the app iconset, a direct resize of Resources/Brand/logo.png (a finished,
//   full-bleed square badge; macOS applies its own squircle mask and shadow)
// - two menu bar glyphs, trimmed from the two-tone artwork at
//   Resources/Brand/menubar-mark.png (black ink, for a light menu bar) and
//   Resources/Brand/menubar-mark-white.png (white ink, for a dark menu bar).
//   Both keep their real pixel colors (eyes, wrench highlight) instead of
//   collapsing to a flat template silhouette.
// - the in-app BrandMark, trimmed from the black mark for template tinting.
// Usage: swift Tools/MakeIcon.swift <output-folder.iconset>
import AppKit

// Current macOS misreads PNG payloads in the legacy small chunks. It downsamples
// ic07 for 1x and uses the explicit ic11/ic12 representations on Retina displays.
let iconSizes: [(name: String, px: Int, icnsType: String?)] = [
    ("icon_16x16", 16, nil), ("icon_16x16@2x", 32, "ic11"),
    ("icon_32x32", 32, nil), ("icon_32x32@2x", 64, "ic12"),
    ("icon_128x128", 128, "ic07"), ("icon_128x128@2x", 256, "ic13"),
    ("icon_256x256", 256, "ic08"), ("icon_256x256@2x", 512, "ic14"),
    ("icon_512x512", 512, "ic09"), ("icon_512x512@2x", 1024, "ic10"),
]

let outDir = CommandLine.arguments.count > 1 ? CommandLine.arguments[1] : "AppIcon.iconset"
let scriptDir = URL(fileURLWithPath: CommandLine.arguments[0]).deletingLastPathComponent()
let projectDir = scriptDir.deletingLastPathComponent()
let logoPath = projectDir.appendingPathComponent("Resources/Brand/logo.png").path
let markPath = projectDir.appendingPathComponent("Resources/Brand/menubar-mark.png").path
let markWhitePath = projectDir.appendingPathComponent("Resources/Brand/menubar-mark-white.png").path

guard let logo = NSImage(contentsOfFile: logoPath) else {
    print("could not load \(logoPath)")
    exit(1)
}

/// A two-tone mark loaded alongside the trimmed rect of its own visible pixels,
/// so each variant (which may have different padding) is measured on its own.
struct Mark {
    let image: NSImage
    let sourceRect: CGRect

    init?(path: String) {
        guard let image = NSImage(contentsOfFile: path),
              let tiff = image.tiffRepresentation,
              let rep = NSBitmapImageRep(data: tiff)
        else { return nil }
        let bounds = Mark.contentBounds(of: rep)
        // NSImage draws bottom-up while colorAt() is top-down — flip Y for drawing.
        self.image = image
        self.sourceRect = CGRect(x: bounds.minX,
                                 y: CGFloat(rep.pixelsHigh) - bounds.maxY,
                                 width: bounds.width,
                                 height: bounds.height)
    }

    /// Bounding box of visible (non-transparent) pixels, so the mark can be
    /// centered optically regardless of padding in the source file.
    private static func contentBounds(of rep: NSBitmapImageRep) -> CGRect {
        var minX = rep.pixelsWide, minY = rep.pixelsHigh, maxX = 0, maxY = 0
        for y in 0..<rep.pixelsHigh {
            for x in 0..<rep.pixelsWide {
                if let color = rep.colorAt(x: x, y: y), color.alphaComponent > 0.05 {
                    minX = min(minX, x); maxX = max(maxX, x)
                    minY = min(minY, y); maxY = max(maxY, y)
                }
            }
        }
        guard maxX > minX, maxY > minY else {
            return CGRect(x: 0, y: 0, width: rep.pixelsWide, height: rep.pixelsHigh)
        }
        return CGRect(x: minX, y: minY, width: maxX - minX + 1, height: maxY - minY + 1)
    }

    /// Draws the trimmed artwork fitted into `target`, preserving aspect ratio
    /// and its own real pixel colors.
    func draw(into target: CGRect) {
        let scale = min(target.width / sourceRect.width, target.height / sourceRect.height)
        let size = CGSize(width: sourceRect.width * scale, height: sourceRect.height * scale)
        let rect = CGRect(x: target.midX - size.width / 2,
                          y: target.midY - size.height / 2,
                          width: size.width, height: size.height)
        image.draw(in: rect, from: sourceRect, operation: .sourceOver, fraction: 1,
                   respectFlipped: false, hints: [.interpolation: NSImageInterpolation.high.rawValue])
    }
}

guard let mark = Mark(path: markPath) else {
    print("could not load \(markPath)")
    exit(1)
}
guard let markWhite = Mark(path: markWhitePath) else {
    print("could not load \(markWhitePath)")
    exit(1)
}

func bitmapCanvas(_ px: Int, _ py: Int) -> NSBitmapImageRep? {
    NSBitmapImageRep(bitmapDataPlanes: nil, pixelsWide: px, pixelsHigh: py,
                     bitsPerSample: 8, samplesPerPixel: 4, hasAlpha: true,
                     isPlanar: false, colorSpaceName: .deviceRGB,
                     bytesPerRow: 0, bitsPerPixel: 0)
}

// MARK: - App icon

// The logo is a finished, full-bleed square badge (its own background, no
// transparency): a direct high-quality resize per size. macOS applies the
// standard squircle mask and shadow to every app icon automatically.
func renderAppIcon(px: Int) -> Data? {
    let size = CGFloat(px)
    guard let rep = bitmapCanvas(px, px), let ctx = NSGraphicsContext(bitmapImageRep: rep) else { return nil }
    rep.size = NSSize(width: size, height: size)

    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = ctx
    logo.draw(in: NSRect(x: 0, y: 0, width: size, height: size),
              from: NSRect(origin: .zero, size: logo.size),
              operation: .sourceOver, fraction: 1,
              respectFlipped: false, hints: [.interpolation: NSImageInterpolation.high.rawValue])
    NSGraphicsContext.restoreGraphicsState()
    return rep.representation(using: .png, properties: [:])
}

// MARK: - Menu bar glyph

// The mark is ~1.97:1, so fitting it into a fixed box made the width the
// limiting side and left the height unused, rendering it far shorter than the
// menu bar icons around it. Size from the height and let the width follow.
let menuBarGlyphHeight: CGFloat = 16
// Centered geometrically the mark reads high, since the thin ring tails carry
// the bounding box below the planet body. Drop it onto the same visual floor
// as its neighbours.
let menuBarGlyphDrop: CGFloat = 1.3
// Taller than the mark needs: the same canvas holds the compact Keep Awake
// symbols. Keep in sync with BlackHoleGlyph.pointSize in
// Sources/Kryon/App/StatusItemController.swift; `--selftest` enforces it.
let menuBarCanvas = (width: 34, height: 24)

func renderMenuBarIcon(_ mark: Mark, scale: Int) -> Data? {
    let width = menuBarCanvas.width * scale, height = menuBarCanvas.height * scale
    guard let rep = bitmapCanvas(width, height), let ctx = NSGraphicsContext(bitmapImageRep: rep) else { return nil }
    rep.size = NSSize(width: menuBarCanvas.width, height: menuBarCanvas.height)

    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = ctx
    // Height-limited target spanning the full canvas width: draw() keeps the
    // aspect ratio and centers. Coordinates are bottom-up, so dropping it
    // lowers y.
    let ink = menuBarGlyphHeight * CGFloat(scale)
    let y = (CGFloat(height) - ink) / 2 - menuBarGlyphDrop * CGFloat(scale)
    mark.draw(into: CGRect(x: 0, y: y, width: CGFloat(width), height: ink))
    NSGraphicsContext.restoreGraphicsState()
    return rep.representation(using: .png, properties: [:])
}

func appendFourCC(_ value: String, to data: inout Data) {
    data.append(contentsOf: value.utf8)
}

func appendUInt32BE(_ value: Int, to data: inout Data) {
    let clamped = UInt32(value)
    data.append(UInt8((clamped >> 24) & 0xff))
    data.append(UInt8((clamped >> 16) & 0xff))
    data.append(UInt8((clamped >> 8) & 0xff))
    data.append(UInt8(clamped & 0xff))
}

func writeICNS(entries: [(type: String, data: Data)], to url: URL) throws {
    let totalLength = 8 + entries.reduce(0) { $0 + 8 + $1.data.count }
    var icns = Data()
    appendFourCC("icns", to: &icns)
    appendUInt32BE(totalLength, to: &icns)
    for entry in entries {
        appendFourCC(entry.type, to: &icns)
        appendUInt32BE(8 + entry.data.count, to: &icns)
        icns.append(entry.data)
    }
    try icns.write(to: url)
}

try? FileManager.default.createDirectory(atPath: outDir, withIntermediateDirectories: true)
var icnsEntries: [(type: String, data: Data)] = []
for (name, px, icnsType) in iconSizes {
    guard let data = renderAppIcon(px: px) else {
        print("failed to render \(name)")
        exit(1)
    }
    try data.write(to: URL(fileURLWithPath: "\(outDir)/\(name).png"))
    if let icnsType {
        icnsEntries.append((type: icnsType, data: data))
    }
}
try writeICNS(entries: icnsEntries, to: URL(fileURLWithPath: "\(outDir)/../AppIcon.icns"))

for (variant, source) in [("Black", mark), ("White", markWhite)] {
    for scale in [1, 2] {
        guard let data = renderMenuBarIcon(source, scale: scale) else {
            print("failed to render \(variant) menu bar icon @\(scale)x")
            exit(1)
        }
        let suffix = scale == 1 ? "" : "@2x"
        try data.write(to: URL(fileURLWithPath: "\(outDir)/../MenuBarIcon\(variant)\(suffix).png"))
    }
}

// Trimmed mark for in-app use (panel header, onboarding, command bar): the
// black variant, tinted at runtime to match whatever surface it sits on.
let brandMarkWidth = 640
let brandMarkHeight = Int(CGFloat(brandMarkWidth) * mark.sourceRect.height / mark.sourceRect.width)
if let rep = bitmapCanvas(brandMarkWidth, brandMarkHeight), let ctx = NSGraphicsContext(bitmapImageRep: rep) {
    rep.size = NSSize(width: brandMarkWidth, height: brandMarkHeight)
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = ctx
    mark.draw(into: CGRect(x: 0, y: 0, width: CGFloat(brandMarkWidth), height: CGFloat(brandMarkHeight)))
    NSGraphicsContext.restoreGraphicsState()
    if let data = rep.representation(using: .png, properties: [:]) {
        try data.write(to: URL(fileURLWithPath: "\(outDir)/../BrandMark.png"))
    }
}
print("iconset written to \(outDir)")
