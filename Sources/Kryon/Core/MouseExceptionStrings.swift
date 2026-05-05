// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct MouseExceptionStrings {
    let listTitle: String
    let addButton: String
    let removeButton: String
    let captionSmoothScroll: String
    let captionScrollDirection: String
    let captionNavigation: String
    let captionButtonShortcuts: String
    let captionMiddleClick: String

    func caption(for scope: MouseExceptionScope) -> String {
        switch scope {
        case .smoothScroll: return captionSmoothScroll
        case .scrollDirection: return captionScrollDirection
        case .navigation: return captionNavigation
        case .buttonShortcuts: return captionButtonShortcuts
        case .middleClick: return captionMiddleClick
        }
    }
}

extension FeatureStrings {
    static func mouseExceptions(_ language: AppLanguage) -> MouseExceptionStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension MouseExceptionStrings {
    static let enUS = MouseExceptionStrings(
        listTitle: "Apps to leave alone",
        addButton: "Add an app…",
        removeButton: "Remove",
        captionSmoothScroll: "The wheel keeps its plain steps in these apps, for apps that read it their own way, like 3D and design tools.",
        captionScrollDirection: "The wheel keeps the direction macOS gives it in these apps.",
        captionNavigation: "The side buttons keep doing whatever these apps already do with them.",
        captionButtonShortcuts: "Your button shortcuts stay quiet in these apps, and the press reaches them instead.",
        captionMiddleClick: "A three finger click stays a normal click in these apps."
    )

}
