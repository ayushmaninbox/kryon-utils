// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

/// Localized strings for the scratchpad, the floating pad for short-lived text.
struct ScratchpadFeatureStrings {
    let pageTitle: String
    let hubDescription: String
    let panelCaption: String
    let openButton: String
    let placeholder: String
    let copyAll: String
    let copied: String
    let exportAction: String
    let clearAction: String
    let retentionTitle: String
    let retentionNever: String
    let retentionDay: String
    let retentionWeek: String
    let retentionMonth: String
    let retentionCaption: String
    let closeOnClickOutside: String
    let keepOpen: String
    let backgroundOpacity: String
    let backgroundTranslucent: String
    let backgroundOpaque: String
    let newPad: String
    let padActions: String
    let renamePad: String
    let closePad: String
    let saveName: String
    let cancel: String
    let deletePadMessageFormat: String
    let padLimitFormat: String
    let previewFormatting: String
    let editText: String
}

extension FeatureStrings {
    static func scratchpad(_ language: AppLanguage) -> ScratchpadFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension ScratchpadFeatureStrings {
    static let enUS = ScratchpadFeatureStrings(
        pageTitle: "Scratchpad",
        hubDescription: "Floating pads for short-lived notes",
        panelCaption: "Quick notes in separate tabs",
        openButton: "Open scratchpad",
        placeholder: "Type anything. It saves by itself.",
        copyAll: "Copy all",
        copied: "Copied",
        exportAction: "Save as file",
        clearAction: "Clear",
        retentionTitle: "Clear on its own",
        retentionNever: "Never",
        retentionDay: "After a day unused",
        retentionWeek: "After a week unused",
        retentionMonth: "After a month unused",
        retentionCaption: "The pad empties itself once the text goes that long without edits.",
        closeOnClickOutside: "Close when I click outside",
        keepOpen: "Keep open",
        backgroundOpacity: "Pad background",
        backgroundTranslucent: "Translucent",
        backgroundOpaque: "Opaque",
        newPad: "New scratchpad",
        padActions: "Scratchpad actions",
        renamePad: "Rename scratchpad",
        closePad: "Close scratchpad",
        saveName: "Save",
        cancel: "Cancel",
        deletePadMessageFormat: "Delete “%@” and everything in it?",
        padLimitFormat: "You can keep up to %d scratchpads",
        previewFormatting: "Show formatting",
        editText: "Edit text"
    )

}
