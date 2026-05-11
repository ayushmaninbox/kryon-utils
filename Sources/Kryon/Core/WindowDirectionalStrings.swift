// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

struct WindowDirectionalStrings {
    let title: String
    let caption: String

    static func localized(_ language: AppLanguage) -> WindowDirectionalStrings {
        switch language {
        case .enUS: return .init(title: "Shortcut + pointer layout", caption: "Hold the shortcut, move the pointer toward an edge or corner, then release to place the active window.")
        }
    }
}
