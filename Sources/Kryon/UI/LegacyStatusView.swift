// Legacy AppKit status bar view
import AppKit

class LegacyStatusView: NSView {
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        NSColor.clear.set()
        dirtyRect.fill()
    }
}
