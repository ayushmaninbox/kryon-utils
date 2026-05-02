// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct DiskImageInstallerStrings {
    let title: String
    let hubDescription: String
    let promptTitle: String
    let promptBodyFormat: String
    let installButton: String
    let installedTitle: String
    let installedBodyFormat: String
    let installedKeepingMountBodyFormat: String
    let installedKeepingDownloadBodyFormat: String
    let failedTitle: String
    let failedBody: String
    let verificationFailedBody: String
    let alreadyInstalledBodyFormat: String
}

extension FeatureStrings {
    static func diskImageInstaller(_ language: AppLanguage) -> DiskImageInstallerStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension DiskImageInstallerStrings {
    static let enUS = DiskImageInstallerStrings(
        title: "Disk image installer",
        hubDescription: "Install the single app inside a disk image and clean up the download",
        promptTitle: "Install this app?",
        promptBodyFormat: "%@ will be copied to Applications. The disk image is then ejected and its download moved to Trash.",
        installButton: "Install",
        installedTitle: "App installed",
        installedBodyFormat: "%@ is ready in Applications. The disk image was ejected and its download moved to Trash.",
        installedKeepingMountBodyFormat: "%@ is installed, but the disk image could not be ejected. Its download was kept.",
        installedKeepingDownloadBodyFormat: "%@ is installed and the disk image was ejected, but its download could not be moved to Trash.",
        failedTitle: "Could not install",
        failedBody: "Nothing was changed. You can still drag the app to Applications.",
        verificationFailedBody: "This Mac could not verify the app, so nothing was installed.",
        alreadyInstalledBodyFormat: "%@ is already in Applications."
    )

}
