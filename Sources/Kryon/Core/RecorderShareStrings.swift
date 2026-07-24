// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct RecorderShareStrings {
    let caption: String
    let privacyData: String
    let privacyStorage: String
    let privacyAccess: String
    // MARK: - Pipeline refinement (324)
    let compressing: String
    let uploading: String
    let tooLarge: String
    let failed: String
    let tourCaption: String
}

extension FeatureStrings {
    static func recorderShare(_ language: AppLanguage) -> RecorderShareStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension RecorderShareStrings {
    static let enUS = RecorderShareStrings(
        caption: "Choose 1 or 6 hours. The final video is compressed on this Mac to fit under 100 MB and deleted automatically.",
        privacyData: "Kryon sends only the final video created from this recording, including the audio you kept, and the expiration you choose. It does not send your name, account or device identifier.",
        privacyStorage: "Network providers and the service temporarily process your public IP to prevent abuse. The video and link metadata are permanently deleted when you delete the link or its time ends. The service does not create backups.",
        privacyAccess: "Anyone with the link can view, download, save or redistribute the video. Active links are available to the service operator for abuse moderation. Share only with people you trust.",
        compressing: "Compressing for sharing…",
        uploading: "Uploading securely…",
        tooLarge: "This recording cannot fit under 100 MB without losing too much quality.",
        failed: "The temporary link could not be created",
        tourCaption: "Compress a finished recording on this Mac and share it for 1 or 6 hours."
    )

}
