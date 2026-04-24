// swift-tools-version:5.9
// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import PackageDescription

let package = Package(
    name: "Kryon",
    platforms: [.macOS(.v14)],
    targets: [
        .executableTarget(
            name: "Kryon",
            path: "Sources/Kryon"
        )
    ]
)
