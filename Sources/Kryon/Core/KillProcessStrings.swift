// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

/// Strings for the Kill Process feature. Same contract as the other
/// FeatureStrings structs: memberwise init in declaration order, one static
/// per language, all in this file.
struct KillProcessFeatureStrings {
    let pageTitle: String
    let browseSubtitle: String
    let hubDescription: String
    let searchPlaceholder: String
    let columnProcess: String
    let columnCPU: String
    let columnMemory: String
    let columnPID: String
    let groupToggle: String
    let groupCaption: String
    let commandBarToggle: String
    let commandBarCaption: String
    let refreshTooltip: String
    let pidLabelFormat: String
    let processCountFormat: String
    let killButton: String
    let forceKillButton: String
    let killAllFormat: String
    let killTreeButton: String
    let restartButton: String
    let copyPID: String
    let copyPath: String
    let emptyStateTitle: String
    let confirmKillFormat: String
    let confirmForceKillFormat: String
    let confirmKillAllFormat: String
    let confirmKillTreeFormat: String
    let killFailedTitle: String
    let killFailedMessage: String
    let adminPromptFormat: String
}

extension FeatureStrings {
    static func killProcess(_ language: AppLanguage) -> KillProcessFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension KillProcessFeatureStrings {
    static let enUS = KillProcessFeatureStrings(
        pageTitle: "Kill Process",
        browseSubtitle: "Browse & Kill",
        hubDescription: "Search running processes and force quit, restart, or kill process trees",
        searchPlaceholder: "Filter by name",
        columnProcess: "Process",
        columnCPU: "CPU",
        columnMemory: "Memory",
        columnPID: "PID",
        groupToggle: "Group related processes",
        groupCaption: "Groups helper processes under the app responsible for them.",
        commandBarToggle: "Show in Command Bar",
        commandBarCaption: "Adds running processes to the Command Bar, so you can find and kill them without opening Settings.",
        refreshTooltip: "Refresh",
        pidLabelFormat: "PID %d",
        processCountFormat: "%d processes",
        killButton: "Kill",
        forceKillButton: "Force Kill",
        killAllFormat: "Kill All “%@”",
        killTreeButton: "Kill Process Tree",
        restartButton: "Restart",
        copyPID: "Copy PID",
        copyPath: "Copy Path",
        emptyStateTitle: "No Processes Found",
        confirmKillFormat: "Kill %@?",
        confirmForceKillFormat: "Force Kill %@?",
        confirmKillAllFormat: "Kill all “%@” processes?",
        confirmKillTreeFormat: "Kill %@ and all its child processes?",
        killFailedTitle: "Couldn’t Kill Process",
        killFailedMessage: "The process may have already exited or require additional privileges.",
        adminPromptFormat: "Kryon needs administrator access to end “%@”."
    )

}
