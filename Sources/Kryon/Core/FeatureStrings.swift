// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

enum FeatureStrings {
    static func settingsCategories(_ language: AppLanguage) -> SettingsCategoryStrings {
        switch language {
        case .enUS: return .enUS
        }
    }

    static func clipboard(_ language: AppLanguage) -> ClipboardFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }

    static func windowLayout(_ language: AppLanguage) -> WindowLayoutFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }

    static func monitorAlerts(_ language: AppLanguage) -> MonitorAlertFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }

    static func mixer(_ language: AppLanguage) -> MixerFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }

    static func whatsAppDownloads(_ language: AppLanguage) -> WhatsAppDownloadStrings {
        WhatsAppDownloadStrings.localized(language)
    }
}

struct MixerFeatureStrings {
    let hideInactiveApps: String

    static let enUS = MixerFeatureStrings(hideInactiveApps: "Hide inactive apps")
}

extension SettingsCategoryStrings {
}

extension ClipboardFeatureStrings {
}

extension WindowLayoutFeatureStrings {
}

extension MonitorAlertFeatureStrings {
}

struct SettingsCategoryStrings {
    let essentials: String
    let windowsControls: String
    let files: String
    let utilities: String
    let app: String
    let appManagement: String

    static let enUS = SettingsCategoryStrings(
        essentials: "Essentials",
        windowsControls: "Window controls",
        files: "Files",
        utilities: "Utilities",
        app: "App",
        appManagement: "App management"
    )

}

struct ClipboardFeatureStrings {
    let title: String
    let enable: String
    let caption: String
    let localNote: String
    let skipSensitive: String
    let skipSensitiveCaption: String
    let limit: String
    let showInPanel: String
    let shortcut: String
    let shortcutCaption: String
    let shortcutHint: String
    let clickRowShortcut: String
    let commandClickShortcut: String
    let pinned: String
    let recent: String
    let pin: String
    let unpin: String
    let clearRecent: String
    let clearAll: String
    let empty: String
    let disabled: String
    let search: String
    let copy: String
    let copied: String
    let delete: String
    let selectMultiple: String
    let unselectMultiple: String
    let selectShortcutAction: String
    let pasteSelectedFormat: String
    let copySelectedFormat: String
    let clearSelection: String
    let moveUp: String
    let moveDown: String
    let noResults: String
    let newestFirst: String
    let active: String
    let includeImagesFiles: String
    let includeImagesFilesCaption: String
    let imageEntryLabel: String
    let fileCountFormat: String
    let pasteImageAsFile: String
    let pasteImageAsFileCaption: String
    let previewLabel: String
    let edit: String
    let cancel: String
    let save: String
    let autoClearEnable: String
    let autoClearSecondsSuffix: String
    let autoClearOnSleep: String
    let autoClearOnDisplaySleep: String
    let autoClearOnScreenLock: String
    let autoClearCaption: String

    static let enUS = ClipboardFeatureStrings(
        title: "Clipboard",
        enable: "Save clipboard history",
        caption: "Stores copied text so you can reuse it later. Everything stays local and can be cleared anytime.",
        localNote: "Everything stays on this Mac. Very large items are ignored.",
        skipSensitive: "Skip text that looks sensitive",
        skipSensitiveCaption: "Avoids saving short no-space strings that look like passwords, tokens or keys.",
        limit: "Limit",
        showInPanel: "Show in panel",
        shortcut: "History shortcut",
        shortcutCaption: "Opens a quick window with search, pinned items and ⌘1 to ⌘9 shortcuts for pasting into the previous app.",
        shortcutHint: "Click a row to paste it into the previous app. ⌘-click selects several; ⌘C copies without pasting.",
        clickRowShortcut: "Click row",
        commandClickShortcut: "⌘ Click",
        pinned: "Pinned",
        recent: "Recent",
        pin: "Pin",
        unpin: "Unpin",
        clearRecent: "Clear recent",
        clearAll: "Clear unpinned",
        empty: "No saved text",
        disabled: "Enable history to start saving copied text.",
        search: "Search copied text",
        copy: "Copy",
        copied: "Copied",
        delete: "Delete item",
        selectMultiple: "Add to pile",
        unselectMultiple: "Remove from pile",
        selectShortcutAction: "Select",
        pasteSelectedFormat: "Paste %d",
        copySelectedFormat: "Copy %d",
        clearSelection: "Clear selection",
        moveUp: "Move up",
        moveDown: "Move down",
        noResults: "No results",
        newestFirst: "Newest first",
        active: "Saving new text",
        includeImagesFiles: "Also save copied images and files",
        includeImagesFilesCaption: "Images join the history and files are remembered as links to their location. Pin and paste them like any text item.",
        imageEntryLabel: "Image",
        fileCountFormat: "%d files",
        pasteImageAsFile: "Paste copied images as files",
        pasteImageAsFileCaption: "When Finder is active, ⌘V saves a copied image as a PNG in the current folder.",
        previewLabel: "Preview",
        edit: "Edit",
        cancel: "Cancel",
        save: "Save",
        autoClearEnable: "Auto clear clipboard with a delay of",
        autoClearSecondsSuffix: "seconds",
        autoClearOnSleep: "Clear clipboard on computer sleep",
        autoClearOnDisplaySleep: "Clear clipboard on display sleep",
        autoClearOnScreenLock: "Clear clipboard on screen lock",
        autoClearCaption: "Clears the system clipboard only. Items already saved stay in the history."
    )

}

struct WindowLayoutFeatureStrings {
    let title: String
    let caption: String
    let showInPanel: String
    let gestureSection: String
    let gestureEnable: String
    let gestureCaption: String
    let gestureModifiers: String
    let gestureMove: String
    let gestureResize: String
    let gestureResizeHint: String
    let gestureRaiseWindow: String
    let shortcuts: String
    let shortcutsCaption: String
    let permissionCaption: String
    let noWindow: String
    let missingPermission: String
    let failed: String
    let done: String
    let restored: String
    let noRestore: String
    let target: String
    let halves: String
    let thirds: String
    let sixths: String
    let corners: String
    let other: String
    let leftHalf: String
    let rightHalf: String
    let topHalf: String
    let bottomHalf: String
    let leftThird: String
    let centerThird: String
    let rightThird: String
    let leftTwoThirds: String
    let rightTwoThirds: String
    let topLeftSixth: String
    let topCenterSixth: String
    let topRightSixth: String
    let bottomLeftSixth: String
    let bottomCenterSixth: String
    let bottomRightSixth: String
    let topLeft: String
    let topRight: String
    let bottomLeft: String
    let bottomRight: String
    let maximize: String
    let center: String
    let nextDisplay: String
    let restore: String
    let fullScreen: String
    let previousDisplay: String
    let edgeSnapEnable: String
    let edgeSnapCaption: String
    let edgeSnapSystemConflict: String
    let edgeSnapOpenSystemSettings: String
    let edgeSnapWaitingForSystem: String
    let marginMaximize: String

    static let enUS = WindowLayoutFeatureStrings(
        title: "Window layout",
        caption: "Arrange windows into screen sections or move and resize them with a trackpad or mouse.",
        showInPanel: "Show in panel",
        gestureSection: "Window dragging",
        gestureEnable: "Move and resize by dragging",
        gestureCaption: "On a trackpad or mouse, hold the shown modifier keys and drag anywhere inside a window.",
        gestureModifiers: "Keys to move",
        gestureMove: "Drag to move",
        gestureResize: "Add Shift and drag to resize",
        gestureResizeHint: "The starting point chooses the nearest edge or corner. On a mouse, right-button drag also resizes.",
        gestureRaiseWindow: "Bring the dragged window to front",
        shortcuts: "Shortcuts",
        shortcutsCaption: "Use global shortcuts to arrange the active window without opening the panel.",
        permissionCaption: "Uses Accessibility only to move and resize windows.",
        noWindow: "No active window found.",
        missingPermission: "Grant Accessibility to move windows.",
        failed: "Could not move this window.",
        done: "Window arranged.",
        restored: "Window restored.",
        noRestore: "No previous layout to restore.",
        target: "Active window",
        halves: "Halves",
        thirds: "Thirds",
        sixths: "Sixths",
        corners: "Corners",
        other: "Actions",
        leftHalf: "Left",
        rightHalf: "Right",
        topHalf: "Top",
        bottomHalf: "Bottom",
        leftThird: "Left 1/3",
        centerThird: "Center 1/3",
        rightThird: "Right 1/3",
        leftTwoThirds: "Left 2/3",
        rightTwoThirds: "Right 2/3",
        topLeftSixth: "Top left 1/6",
        topCenterSixth: "Top center 1/6",
        topRightSixth: "Top right 1/6",
        bottomLeftSixth: "Bottom left 1/6",
        bottomCenterSixth: "Bottom center 1/6",
        bottomRightSixth: "Bottom right 1/6",
        topLeft: "Top left",
        topRight: "Top right",
        bottomLeft: "Bottom left",
        bottomRight: "Bottom right",
        maximize: "Maximize",
        center: "Center",
        nextDisplay: "Next display",
        restore: "Restore",
        fullScreen: "Full Screen",
        previousDisplay: "Previous display",
        edgeSnapEnable: "Snap windows at screen edges",
        edgeSnapCaption: "Turn this on, then drag a window title bar to any screen edge or corner and release.",
        edgeSnapSystemConflict: "macOS is using the same edges. Turn off window tiling in Desktop & Dock so Kryon can take over.",
        edgeSnapOpenSystemSettings: "Open Desktop & Dock",
        edgeSnapWaitingForSystem: "Enabled in Kryon. It starts working as soon as macOS tiling is off.",
        marginMaximize: "Maximize with Margin"
    )

}

struct MonitorAlertFeatureStrings {
    let section: String
    let caption: String
    let notificationsDenied: String
    let cpu: String
    let cpuTemperature: String
    let memory: String
    let disk: String
    let battery: String
    let cpuThreshold: String
    let cpuTemperatureThreshold: String
    let diskThreshold: String
    let batteryThreshold: String
    let cooldown: String
    let cooldown2: String
    let cooldown5: String
    let cooldown15: String
    let cooldown30: String
    let cooldown60: String
    let cpuTitle: String
    let cpuBodyFormat: String
    let cpuTemperatureTitle: String
    let cpuTemperatureBodyFormat: String
    let memoryTitle: String
    let memoryBody: String
    let diskTitle: String
    let diskBodyFormat: String
    let batteryTitle: String
    let batteryBodyFormat: String

    static let enUS = MonitorAlertFeatureStrings(
        section: "Alerts",
        caption: "Alerts fire when their selected limits are reached. CPU use and temperature ignore spikes shorter than about 12 seconds. The repeat setting only limits repeats of the same alert.",
        notificationsDenied: "Notifications for Kryon are off in System Settings, so alerts cannot appear.",
        cpu: "High CPU",
        cpuTemperature: "High CPU temperature",
        memory: "Critical memory pressure",
        disk: "Low disk space",
        battery: "Low battery",
        cpuThreshold: "CPU above",
        cpuTemperatureThreshold: "Temperature above",
        diskThreshold: "Free space below",
        batteryThreshold: "Battery below",
        cooldown: "Repeat the same alert after",
        cooldown2: "2 minutes",
        cooldown5: "5 minutes",
        cooldown15: "15 minutes",
        cooldown30: "30 minutes",
        cooldown60: "1 hour",
        cpuTitle: "High CPU",
        cpuBodyFormat: "CPU stayed above %d%% for a few seconds.",
        cpuTemperatureTitle: "Hot CPU",
        cpuTemperatureBodyFormat: "CPU reached %d °C.",
        memoryTitle: "Critical memory",
        memoryBody: "Memory pressure reached the critical level.",
        diskTitle: "Low disk space",
        diskBodyFormat: "%@ has less than %d%% free.",
        batteryTitle: "Low battery",
        batteryBodyFormat: "Battery is at %d%%."
    )

}
