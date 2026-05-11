// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct WhatsAppOrganizerStrings {
    let title: String
    let experimental: String
    let description: String
    let enabled: String
    let enabledCaption: String
    let destination: String
    let chooseFolder: String
    let useDefault: String
    let invalidDestination: String
    let organization: String
    let flat: String
    let byType: String
    let byMonth: String
    let delay: String
    let minutesFormat: String
    let duplicateAction: String
    let trashDuplicate: String
    let keepBoth: String
    let replaceExisting: String
    let duplicateCaption: String
    let organizeNow: String
    let undo: String
    let waiting: String
    let working: String
    let resultFormat: String
    let lastRunFormat: String
    let neverRun: String
    let notificationTitle: String
    let notificationFormat: String
    let privacyNote: String

    static func localized(_ language: AppLanguage) -> WhatsAppOrganizerStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension WhatsAppOrganizerStrings {
    static let enUS = WhatsAppOrganizerStrings(
        title: "Automatic organization",
        experimental: "Experimental",
        description: "Moves stable WhatsApp downloads to a dedicated folder and detects exact repeat downloads.",
        enabled: "Organize automatically",
        enabledCaption: "WhatsApp may download a moved file again. Kryon cannot prevent the network download, but it can detect and discard an identical extra copy.",
        destination: "Destination folder",
        chooseFolder: "Choose…",
        useDefault: "Use Downloads/WhatsApp",
        invalidDestination: "Choose a folder other than Downloads itself.",
        organization: "Folder structure",
        flat: "No subfolders",
        byType: "By file type",
        byMonth: "By year and month",
        delay: "Wait before moving",
        minutesFormat: "%d minutes",
        duplicateAction: "When the same file is downloaded again",
        trashDuplicate: "Move the new copy to Trash",
        keepBoth: "Keep both copies",
        replaceExisting: "Replace the organized copy",
        duplicateCaption: "Duplicates are confirmed with a private SHA-256 digest. The organized copy is rechecked before another copy is discarded.",
        organizeNow: "Organize eligible files now",
        undo: "Undo last organization",
        waiting: "Watching Downloads",
        working: "Organizing WhatsApp files…",
        resultFormat: "%1$d moved · %2$d duplicates · %3$d failed",
        lastRunFormat: "Last organization %@: %d moved · %d duplicates · %d failed",
        neverRun: "No organization has run yet.",
        notificationTitle: "WhatsApp organization",
        notificationFormat: "%1$d files organized. %2$d duplicate downloads handled. %3$d failed.",
        privacyNote: "To identify exact duplicates, file bytes are read locally only while calculating a cryptographic digest. Contents and chats are never stored or uploaded."
    )

}
