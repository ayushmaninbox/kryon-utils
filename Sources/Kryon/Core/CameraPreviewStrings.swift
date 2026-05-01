// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

/// Localized strings for the camera preview mirror.
struct CameraPreviewFeatureStrings {
    let pageTitle: String
    let hubDescription: String
    let panelCaption: String
    let openButton: String
    let cameraMenuLabel: String
    let deniedMessage: String
    let noCameraMessage: String
    let permName: String
    let permExplain: String
}

extension FeatureStrings {
    static func cameraPreview(_ language: AppLanguage) -> CameraPreviewFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension CameraPreviewFeatureStrings {
    static let enUS = CameraPreviewFeatureStrings(
        pageTitle: "Camera preview",
        hubDescription: "Opens a floating mirror with your camera",
        panelCaption: "Check how you look before a call",
        openButton: "Open preview",
        cameraMenuLabel: "Camera",
        deniedMessage: "Camera access for Kryon is turned off in System Settings.",
        noCameraMessage: "No camera detected",
        permName: "Camera",
        permExplain: "Shows your camera only in the preview window, so you can check how you look before a call. Nothing is recorded or leaves your Mac."
    )

}
