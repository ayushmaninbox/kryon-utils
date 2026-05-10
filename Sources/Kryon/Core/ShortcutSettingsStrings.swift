// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct ShortcutSettingsStrings {
    let active: String
    let inactive: String
    let superKeyAlternativeFormat: String
}

extension FeatureStrings {
    static func shortcuts(_ language: AppLanguage) -> ShortcutSettingsStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension ShortcutSettingsStrings {
    static let enUS = ShortcutSettingsStrings(
        active: "Active",
        inactive: "Inactive",
        superKeyAlternativeFormat: "or %@"
    )

}
