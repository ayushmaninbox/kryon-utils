// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

/// Strings for the text snippets feature. Same contract as the other
/// FeatureStrings structs: memberwise init in declaration order, one static
/// per language, all in this file.
struct SnippetFeatureStrings {
    let pageTitle: String
    let hubDescription: String
    let enable: String
    let enableCaption: String
    let addButton: String
    let newTitle: String
    let editTitle: String
    let nameLabel: String
    let namePlaceholder: String
    let triggerLabel: String
    let triggerPlaceholder: String
    let replacementLabel: String
    let replacementPlaceholder: String
    let expansionLabel: String
    let expansionImmediate: String
    let expansionDelimiter: String
    let variablesHint: String
    let variablesCaption: String
    let emptyList: String
    let duplicateTrigger: String
    let triggerTooShort: String
    let deleteButton: String
    let saveButton: String
    let manageButton: String
    let ignoreCaseLabel: String
    let libraryTitle: String
    let libraryToggle: String
    let libraryCaption: String
    let librarySearchPlaceholder: String
    let libraryNoResults: String
    let libraryEmpty: String
    let libraryFooterHint: String
    let folderLabel: String
    let folderPlaceholder: String
    let showInLibraryLabel: String
    let variablesFormatCaption: String
}

extension FeatureStrings {
    static func snippets(_ language: AppLanguage) -> SnippetFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension SnippetFeatureStrings {
}

extension SnippetFeatureStrings {
    static let enUS = SnippetFeatureStrings(
        pageTitle: "Text snippets",
        hubDescription: "Short triggers expand into full text",
        enable: "Expand snippets while typing",
        enableCaption: "Type a trigger anywhere and it becomes its text. Everything stays on this Mac.",
        addButton: "Add snippet",
        newTitle: "New snippet",
        editTitle: "Edit snippet",
        nameLabel: "Name",
        namePlaceholder: "Personal email",
        triggerLabel: "Trigger",
        triggerPlaceholder: ";email",
        replacementLabel: "Text",
        replacementPlaceholder: "myemail@example.com",
        expansionLabel: "Expand",
        expansionImmediate: "Right away",
        expansionDelimiter: "After space, Tab or Return",
        variablesHint: "Variables: {{date}}, {{time}}, {{datetime}}, {{clipboard}}",
        variablesCaption: "They become the date, the time and the copied text at the moment of expansion.",
        emptyList: "No snippets yet. Add the first one.",
        duplicateTrigger: "Another snippet already uses this trigger.",
        triggerTooShort: "The trigger needs at least 2 characters.",
        deleteButton: "Delete",
        saveButton: "Save",
        manageButton: "Manage snippets",
        ignoreCaseLabel: "Ignore capitalization",
        libraryTitle: "Quick snippet menu",
        libraryToggle: "Open snippets from a menu",
        libraryCaption: "The shortcut opens a searchable menu. Picking a snippet types it right where your cursor is.",
        librarySearchPlaceholder: "Search snippets",
        libraryNoResults: "No snippet matches the search.",
        libraryEmpty: "Nothing to show yet. Add snippets, or turn on 'Show in the quick menu' for the ones you use most.",
        libraryFooterHint: "↩ inserts · esc closes",
        folderLabel: "Folder",
        folderPlaceholder: "Work",
        showInLibraryLabel: "Show in the quick menu",
        variablesFormatCaption: "A format after a colon picks how they look, like {{date:yyyy-MM-dd}}."
    )

}
