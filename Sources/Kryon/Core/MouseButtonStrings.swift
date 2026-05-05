// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct MouseButtonFeatureStrings {
    let pageTitle: String
    let hubDescription: String
    let enableLabel: String
    let enableCaption: String
    let addButton: String
    let captureWaiting: String
    let captureCancel: String
    let captureBlind: String
    let captureUnsupported: String
    let captureWheel: String
    let captureExists: String
    let captureHint: String
    let backButtonName: String
    let forwardButtonName: String
    let otherButtonFormat: String      // "Button %d"
    let setShortcutButton: String
    let removeButton: String
    let emptyCaption: String
    let rowWheelNote: String
    let manageButton: String
    let panelCaption: String
    let sideWheelLeftName: String
    let sideWheelRightName: String
}

extension FeatureStrings {
    static func mouseButtons(_ language: AppLanguage) -> MouseButtonFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension MouseButtonFeatureStrings {
    static let enUS = MouseButtonFeatureStrings(
        pageTitle: "Mouse button shortcuts",
        hubDescription: "Extra buttons and side-wheel directions press a key combination you choose.",
        enableLabel: "Use extra buttons as shortcuts",
        enableCaption: "Each extra button or side-wheel direction can press a key combination for you. While it has a shortcut, it stops doing what it did before.",
        addButton: "Add a button or side wheel",
        captureWaiting: "Now press an extra button or move the side wheel.",
        captureCancel: "Cancel",
        captureBlind: "Kryon cannot watch the mouse right now.",
        captureUnsupported: "That input cannot take a shortcut. Use an extra button or a side-wheel direction.",
        captureWheel: "That button already opens the radial menu. Pick another one, or free it there first.",
        captureExists: "That button or direction is already on the list below.",
        captureHint: "If nothing happens, your mouse's own software may already be using that control.",
        backButtonName: "Back side button",
        forwardButtonName: "Forward side button",
        otherButtonFormat: "Button %d",
        setShortcutButton: "Set shortcut",
        removeButton: "Remove",
        emptyCaption: "No shortcuts yet. Add a button or side-wheel direction.",
        rowWheelNote: "This button opens the radial menu now, so the shortcut waits.",
        manageButton: "Set up…",
        panelCaption: "Extra buttons and side-wheel directions press key combinations you choose.",
        sideWheelLeftName: "Side wheel left",
        sideWheelRightName: "Side wheel right"
    )

}
