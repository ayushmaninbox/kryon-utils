// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct FinderRenameFeatureStrings {
    let pageTitle: String
    let hubTitle: String
    let hubDescription: String
    let enableLabel: String
    let caption: String
    let shortcutLabel: String
}

extension FeatureStrings {
    static func finderRename(_ language: AppLanguage) -> FinderRenameFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension FinderRenameFeatureStrings {
    static let enUS = FinderRenameFeatureStrings(
        pageTitle: "Finder shortcuts",
        hubTitle: "Rename shortcut",
        hubDescription: "Rename the selected file or folder with a shortcut you choose.",
        enableLabel: "Use a shortcut to rename",
        caption: "The shortcut only acts in Finder and leaves text fields alone. F2 works as a regular key; on keyboards where it controls brightness, use Fn-F2 or choose another shortcut.",
        shortcutLabel: "Rename"
    )

}
