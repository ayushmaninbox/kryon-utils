// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct RecentCaptureStrings {
    let title: String
    let empty: String
    let screenshot: String
    let recording: String
    let restore: String
    let open: String
    let remove: String
    let clear: String
}

extension FeatureStrings {
    static func recentCaptures(_ language: AppLanguage) -> RecentCaptureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension RecentCaptureStrings {
    static let enUS = RecentCaptureStrings(
        title: "Recent captures",
        empty: "Take a screenshot or save a recording to find it here.",
        screenshot: "Screenshot",
        recording: "Recording",
        restore: "Restore",
        open: "Open",
        remove: "Remove from history",
        clear: "Clear history"
    )

}
