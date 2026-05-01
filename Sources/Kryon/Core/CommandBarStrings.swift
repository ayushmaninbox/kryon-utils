// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

/// Localized strings for the command bar, the type-and-run field that finds
/// everything the app can do. Action rows reuse each feature's own strings;
/// only the bar's chrome lives here.
struct CommandBarFeatureStrings {
    let pageTitle: String
    let hubDescription: String
    let panelCaption: String
    let settingsCaption: String
    let openButton: String
    let searchPlaceholder: String
    let suggestionsLabel: String
    let noResultsTitle: String
    let noResultsAction: String
    let argumentRangeFormat: String
    let argumentHint: String
    let confirmHint: String
    let kindApp: String
    let kindClipboard: String
    let kindSnippet: String
    let soundOutputSubtitle: String
    let soundOutputCurrent: String
    let volumeTitle: String
    let brightnessTitle: String
    let keepAwakeForFormat: String
    let needsSetupFormat: String
    let needsPermissionHint: String
    let actionCheckAppUpdates: String
    let actionCleanURL: String
    let actionOpenSettings: String
    let answerBatteryLabel: String
    let answerBatteryCharging: String
    let answerBatteryPlugged: String
    let answerMemoryLabel: String
    let answerMemoryFormat: String
    let answerStorageLabel: String
    let answerStorageFormat: String
    let copyHint: String
    let kindWindow: String
    let quitFormat: String
    let quitConfirmFormat: String
    let kindMenu: String
    let actionsTitle: String
    let actionsHint: String
    let actionPin: String
    let actionUnpin: String
    let actionName: String
    let actionRename: String
    let actionHide: String
    let actionForget: String
    let aliasPlaceholder: String
    let aliasTakenFormat: String
    let sourcesTitle: String
    let sourcesCaption: String
    let sourceActions: String
    let sourceApps: String
    let sourceMenus: String
    let sourceWindows: String
    let sourceQuitApps: String
    let sourceSettingsPages: String
    let sourceSnippets: String
    let sourceClipboard: String
    let sourceEmoji: String
    let sourceFolders: String
    let sourceAnswers: String
    let sourceCalculator: String
    let namedTitle: String
    let namedEmpty: String
    let pinnedTitle: String
    let pinnedEmpty: String
    let hiddenTitle: String
    let hiddenEmpty: String
    let forgetAllButton: String
    let tryTheseLabel: String
    let stillLooking: String
    let removeButton: String
    let confirmButton: String
    let soundMute: String
    let soundUnmute: String
    let stateOn: String
    let powerSleep: String
    let powerRestart: String
    let powerRestartConfirm: String
    let powerShutDown: String
    let powerShutDownConfirm: String
    let powerLogOut: String
    let powerLogOutConfirm: String
    let wifiOn: String
    let wifiOff: String
    let kindEmoji: String
    let kindFolder: String
    let answerDateLabel: String
    let answerTimeLabel: String
    let kindAnswer: String
    let kindSelection: String
    let selectedTitle: String
    let selectionCopy: String
    let selectionSearch: String
    let selectionUpper: String
    let selectionLower: String
    let selectionTitleCase: String
    let selectionShelf: String
    let selectionCount: String
    let selectionCountFormat: String
    let sourceSelection: String
    let kindLink: String
    let linkSearchHint: String
    let linksTitle: String
    let linksEmpty: String
    let linkDestinationLabel: String
    let linkKindLink: String
    let linkKindPlace: String
    let linkPlaceholdersHint: String
    let placeholderQuery: String
    let placeholderClipboard: String
    let placeholderSelection: String
    let placeholderDate: String
    let privacyNote: String
    let actionShortcut: String
    let actionShortcutChange: String
    let actionShortcutRemove: String
    let shortcutCaptureHint: String
    let rowShortcutsTitle: String
    let rowShortcutsEmpty: String
    let turnOnFormat: String
    let turnOffFormat: String
    let everythingTitle: String
    let categoryAll: String
    let restartAppFormat: String
    let forceQuitAppFormat: String
    let forceQuitAppConfirmFormat: String
    let uninstallAppFormat: String
    let openInBrowser: String
    let linkKindScript: String
    let scriptHint: String
    let scriptRunFailed: String
    let scriptSearchHint: String
    let linkAddButton: String
    let positionCaption: String
    let resetPositionButton: String
    let dragHint: String
    let actionRevealInFinder: String
    let sourceMacSettings: String
    let sourceFiles: String
    let filesTitle: String
    let filesCaption: String
    let filesEmpty: String
    let filesAddFolder: String
    let filesIgnoreCaption: String
    let filesIgnorePlaceholder: String
    let filesIgnoreAdd: String
}

extension FeatureStrings {
    static func commandBar(_ language: AppLanguage) -> CommandBarFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension CommandBarFeatureStrings {
    static let enUS = CommandBarFeatureStrings(
        pageTitle: "Command Bar",
        hubDescription: "One field that finds and runs everything the app does",
        panelCaption: "Type to find and run anything",
        settingsCaption: "One shortcut opens a field over whatever you are doing. Type a few letters, press Return and it happens. Nothing you type is saved.",
        openButton: "Open the bar now",
        searchPlaceholder: "Type what you want to do",
        suggestionsLabel: "Suggestions",
        noResultsTitle: "Nothing here by that name.",
        noResultsAction: "See suggestions",
        argumentRangeFormat: "%d to %d",
        argumentHint: "Return applies · Esc goes back",
        confirmHint: "Return confirms · Esc cancels",
        kindApp: "App",
        kindClipboard: "Paste from history",
        kindSnippet: "Insert snippet",
        soundOutputSubtitle: "Switch sound output",
        soundOutputCurrent: "Current output",
        volumeTitle: "Volume",
        brightnessTitle: "Screen brightness",
        keepAwakeForFormat: "Keep awake for %@",
        needsSetupFormat: "Turn on %@ in Settings",
        needsPermissionHint: "Needs permission · Return asks",
        actionCheckAppUpdates: "Check for app updates",
        actionCleanURL: "Clean the copied link",
        actionOpenSettings: "Open Settings",
        answerBatteryLabel: "Battery",
        answerBatteryCharging: "charging",
        answerBatteryPlugged: "on power",
        answerMemoryLabel: "Memory",
        answerMemoryFormat: "%@ of %@ in use",
        answerStorageLabel: "Storage",
        answerStorageFormat: "%@ free of %@",
        copyHint: "Return copies",
        kindWindow: "Window",
        quitFormat: "Quit %@",
        quitConfirmFormat: "Quit %@?",
        kindMenu: "Menu command",
        actionsTitle: "Actions",
        actionsHint: "Actions",
        actionPin: "Pin to the top",
        actionUnpin: "Unpin",
        actionName: "Give it your own name",
        actionRename: "Change the name it answers to",
        actionHide: "Never show this",
        actionForget: "Forget how often I use this",
        aliasPlaceholder: "The name you call it",
        aliasTakenFormat: "%@ already answers to that",
        sourcesTitle: "What the bar searches",
        sourcesCaption: "Turn off what you never want to see. Your own actions always stay.",
        sourceActions: "Kryon actions",
        sourceApps: "Apps",
        sourceMenus: "Menu commands of the app in front",
        sourceWindows: "Open windows",
        sourceQuitApps: "Quit an app",
        sourceSettingsPages: "Settings pages",
        sourceSnippets: "Snippets",
        sourceClipboard: "Clipboard history",
        sourceEmoji: "Emoji",
        sourceFolders: "Folders",
        sourceAnswers: "Answers about this Mac",
        sourceCalculator: "Sums and conversions",
        namedTitle: "Names you gave",
        namedEmpty: "Nothing named yet. Open the bar, pick a row and press the actions key.",
        pinnedTitle: "Pinned",
        pinnedEmpty: "Nothing pinned yet.",
        hiddenTitle: "Never shown",
        hiddenEmpty: "Nothing hidden.",
        forgetAllButton: "Forget what I use most",
        tryTheseLabel: "Try",
        stillLooking: "Still looking",
        removeButton: "Remove",
        confirmButton: "Confirm",
        soundMute: "Mute the sound",
        soundUnmute: "Turn the sound back on",
        stateOn: "on",
        powerSleep: "Sleep",
        powerRestart: "Restart",
        powerRestartConfirm: "Restart the Mac?",
        powerShutDown: "Shut down",
        powerShutDownConfirm: "Shut down the Mac?",
        powerLogOut: "Log out",
        powerLogOutConfirm: "Log out?",
        wifiOn: "Turn Wi-Fi on",
        wifiOff: "Turn Wi-Fi off",
        kindEmoji: "Emoji",
        kindFolder: "Folder",
        answerDateLabel: "Today",
        answerTimeLabel: "Time now",
        kindAnswer: "Answer",
        kindSelection: "Selection",
        selectedTitle: "Selected",
        selectionCopy: "Copy it",
        selectionSearch: "Use it in the search",
        selectionUpper: "UPPERCASE",
        selectionLower: "lowercase",
        selectionTitleCase: "Title Case",
        selectionShelf: "Keep it on the shelf",
        selectionCount: "Count it",
        selectionCountFormat: "%d words, %d characters",
        sourceSelection: "What is selected",
        kindLink: "Your shortcut",
        linkSearchHint: "Type what to look for after the name",
        linksTitle: "Your shortcuts",
        linksEmpty: "Nothing saved yet. Add a site, folder, search or script you use every day.",
        linkDestinationLabel: "Where it goes",
        linkKindLink: "Site or link",
        linkKindPlace: "Folder or file",
        linkPlaceholdersHint: "Drop one of these in and it gets filled in when it opens",
        placeholderQuery: "what you type",
        placeholderClipboard: "what you copied",
        placeholderSelection: "what is selected",
        placeholderDate: "today",
        privacyNote: "Everything happens on this Mac: no account, no cloud, nothing sent anywhere.",
        actionShortcut: "Give it a shortcut",
        actionShortcutChange: "Change the shortcut",
        actionShortcutRemove: "Take the shortcut off",
        shortcutCaptureHint: "Press the keys you want · Delete clears it · Esc goes back",
        rowShortcutsTitle: "Rows with their own shortcut",
        rowShortcutsEmpty: "No row has its own shortcut yet. Open the actions on any row to give it one.",
        turnOnFormat: "Turn on %@",
        turnOffFormat: "Turn off %@",
        everythingTitle: "Everything it can do",
        categoryAll: "All",
        restartAppFormat: "Restart %@",
        forceQuitAppFormat: "Force Quit %@…",
        forceQuitAppConfirmFormat: "Force quit %@? Unsaved changes will be lost.",
        uninstallAppFormat: "Uninstall %@…",
        openInBrowser: "Open in browser",
        linkKindScript: "Script",
        scriptHint: "Choose an executable file. Type its name followed by what you want to send. It runs when you pause and shows the result here.",
        scriptRunFailed: "Couldn’t run this file",
        scriptSearchHint: "Type what to send after the name",
        linkAddButton: "Add shortcut",
        positionCaption: "Drag the mark at the left of the field to put the bar anywhere on the screen; double-click the mark to put it back where it started.",
        resetPositionButton: "Put the bar back where it started",
        dragHint: "Drag to move · Double-click to put it back",
        actionRevealInFinder: "Show in Finder",
        sourceMacSettings: "System Settings panes",
        sourceFiles: "Files",
        filesTitle: "Search your files",
        filesCaption: "Name the folders to look in and the bar finds files by name as you type. Nothing is indexed and no permission is asked for: it uses the Mac's own search and offers only what you can already see in Finder.",
        filesEmpty: "No folders yet, so the bar looks for no files.",
        filesAddFolder: "Add a folder",
        filesIgnoreCaption: "Names never worth showing: a whole folder or file name, or an extension written as *.log.",
        filesIgnorePlaceholder: "A folder or file name",
        filesIgnoreAdd: "Add")

}
