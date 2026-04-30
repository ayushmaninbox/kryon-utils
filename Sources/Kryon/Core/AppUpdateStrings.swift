// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct AppUpdateStrings {
    let pageTitle: String
    let hubDescription: String
    let caption: String
    let panelCaption: String
    let checkNow: String
    let checking: String
    let lastCheckFormat: String
    let neverChecked: String
    let upToDate: String
    let coverageNote: String
    let selectAll: String
    let clearSelection: String
    let updateSelectedFormat: String
    let updateOne: String
    let openAppStore: String
    let appStoreBadge: String
    let storeHint: String
    let frequencyLabel: String
    let frequencyOff: String
    let frequencyDaily: String
    let frequencyWeekly: String
    let nextCheckFormat: String
    let notifyToggle: String
    let includeStoreToggle: String
    let includeStoreCaption: String
    let packageMissing: String
    let notificationBodyFormat: String
    /// Used when exactly one app is waiting, so the note never reads "1 apps".
    let notificationBodyOne: String
    let showInPanel: String
    let homebrewBadge: String
    let sourcesTitle: String
    let includeHomebrewToggle: String
}

extension FeatureStrings {
    static func appUpdates(_ language: AppLanguage) -> AppUpdateStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension AppUpdateStrings {
    static let enUS = AppUpdateStrings(
        pageTitle: "App updates",
        hubDescription: "Find and install updates for the apps you have",
        caption: "Looks for a newer version of the apps on this Mac and updates the ones you pick, so you do not have to open a store for each one.",
        panelCaption: "See which apps have a newer version",
        checkNow: "Check now",
        checking: "Checking",
        lastCheckFormat: "Last checked %@",
        neverChecked: "Not checked yet",
        upToDate: "Every app is up to date",
        coverageNote: "Covers apps installed with Homebrew and apps from the App Store. Apps that carry their own updater keep updating themselves.",
        selectAll: "Select all",
        clearSelection: "Clear",
        updateSelectedFormat: "Update %d",
        updateOne: "Update",
        openAppStore: "Open the App Store",
        appStoreBadge: "App Store",
        storeHint: "Opens the App Store, where this update is installed",
        frequencyLabel: "Check in the background",
        frequencyOff: "Off",
        frequencyDaily: "Every day",
        frequencyWeekly: "Every week",
        nextCheckFormat: "Next check %@",
        notifyToggle: "Tell me when an app has an update",
        includeStoreToggle: "Include apps from the App Store",
        includeStoreCaption: "Asks Apple which version is current for the apps you got from the store. Turn it off to keep every check on this Mac.",
        packageMissing: "Homebrew is not installed, so apps cannot be updated from here yet.",
        notificationBodyFormat: "%@ apps have a newer version.",
        notificationBodyOne: "One app has a newer version.",
        showInPanel: "Show in panel",
        homebrewBadge: "Homebrew",
        sourcesTitle: "Sources",
        includeHomebrewToggle: "Include Homebrew apps"
    )

}
