// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct RadialMenuFeatureStrings {
    let pageTitle: String
    let hubDescription: String
    let enableLabel: String
    let enableCaption: String
    let positionLabel: String
    let positionPointer: String
    let positionCenter: String
    let tryButton: String
    let actionsHeader: String
    let addButton: String
    let limitCaption: String
    let emptyCaption: String
    let backButton: String
    let editActionsButton: String
    let nameLabel: String
    let automaticLabel: String
    let iconLabel: String
    let actionLabel: String
    let kindApp: String
    let kindFile: String
    let kindURL: String
    let kindShortcut: String
    let kindTool: String
    let kindMedia: String
    let kindSubmenu: String
    let chooseButton: String
    let urlPlaceholder: String
    let urlInvalid: String
    let toolLabel: String
    let mediaLabel: String
    let mediaPlayPause: String
    let mediaPrevious: String
    let mediaNext: String
    let mediaNowPlaying: String
    let mediaNothingPlaying: String
    let mediaOpenAppFormat: String
    let submenuCaption: String
    let saveButton: String
    let deleteButton: String
    let permissionCaption: String
    let manageButton: String
    let panelCaption: String
    let mouseTriggerLabel: String
    let mouseTriggerOff: String
    let mouseTriggerBack: String
    let mouseTriggerForward: String
    let mouseTriggerWarning: String
    let buttonTestLabel: String
    let buttonTestWaiting: String
    let buttonTestSeen: String
    let buttonTestOther: String
    let buttonTestBlind: String
    let buttonTestHint: String
    let activationModeLabel: String
    let activationModePressOrHold: String
    let activationModePress: String
    let activationModeHold: String
    let activationModeCaption: String
}

extension FeatureStrings {
    static func radialMenu(_ language: AppLanguage) -> RadialMenuFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension RadialMenuFeatureStrings {
    static let enUS = RadialMenuFeatureStrings(
        pageTitle: "Radial menu",
        hubDescription: "Opens a wheel of your favorite actions around the pointer",
        enableLabel: "Use the radial menu",
        enableCaption: "Hold the shortcut, point at an action and release. A quick press keeps the wheel open.",
        positionLabel: "Opens",
        positionPointer: "At the pointer",
        positionCenter: "At the screen center",
        tryButton: "Try it",
        actionsHeader: "Actions",
        addButton: "Add action",
        limitCaption: "A wheel holds up to 12 actions.",
        emptyCaption: "No actions here yet.",
        backButton: "Back",
        editActionsButton: "Edit actions",
        nameLabel: "Name",
        automaticLabel: "Automatic",
        iconLabel: "Icon",
        actionLabel: "Action",
        kindApp: "Open an app",
        kindFile: "Open a file or folder",
        kindURL: "Open a link",
        kindShortcut: "Press a shortcut",
        kindTool: "Kryon tool",
        kindMedia: "Media control",
        kindSubmenu: "Submenu",
        chooseButton: "Choose…",
        urlPlaceholder: "example.com",
        urlInvalid: "Enter a valid link.",
        toolLabel: "Tool",
        mediaLabel: "Control",
        mediaPlayPause: "Play or pause",
        mediaPrevious: "Previous track",
        mediaNext: "Next track",
        mediaNowPlaying: "Now Playing",
        mediaNothingPlaying: "Nothing playing",
        mediaOpenAppFormat: "Open %@",
        submenuCaption: "Opens a second wheel with its own actions.",
        saveButton: "Save",
        deleteButton: "Remove",
        permissionCaption: "Key actions and the side mouse button trigger need the Accessibility permission.",
        manageButton: "Manage the menu",
        panelCaption: "Your favorite actions on a wheel",
        mouseTriggerLabel: "Mouse button",
        mouseTriggerOff: "Off",
        mouseTriggerBack: "Back side button",
        mouseTriggerForward: "Forward side button",
        mouseTriggerWarning: "While this is on, that button no longer goes back or forward in apps. If you navigate with it, leave this off.",
        buttonTestLabel: "Button test",
        buttonTestWaiting: "Press the button now",
        buttonTestSeen: "Kryon sees this button",
        buttonTestOther: "That was a different button",
        buttonTestBlind: "Kryon cannot watch the mouse right now",
        buttonTestHint: "If nothing lights up, macOS is not sending that button to apps. Mice that come with their own software often turn the side buttons into something else. Change it back there, or give the button a key combination and use that combination above.",
        activationModeLabel: "Opening behavior",
        activationModePressOrHold: "Press or hold",
        activationModePress: "Press to open",
        activationModeHold: "Hold to select",
        activationModeCaption: "Press or hold keeps the current adaptive gesture. Press stays open; hold runs the highlighted action on release."
    )

}
