// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct WindowPreviewExclusionStrings {
    let sectionTitle: String
    let listTitle: String
    let addButton: String
    let removeButton: String
    let caption: String
}

extension FeatureStrings {
    static func windowPreviewExclusions(_ language: AppLanguage) -> WindowPreviewExclusionStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension WindowPreviewExclusionStrings {
    static let enUS = WindowPreviewExclusionStrings(
        sectionTitle: "Window thumbnails",
        listTitle: "Pause in these apps",
        addButton: "Add an app…",
        removeButton: "Remove",
        caption: "Window thumbnails stop while one of these apps is in front."
    )

}
