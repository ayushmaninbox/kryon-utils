// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct KeepAwakeAutomationStrings {
    let automationSection: String
    let automationCaption: String
    let automationOff: String
    let externalDisplayToggle: String
    let externalDisplayActive: String
    let powerToggle: String
    let powerActive: String
    let automationActive: String

    func activeStatus(for conditions: Set<KeepAwakeAutomationCondition>) -> String {
        if conditions == [.externalDisplay] { return externalDisplayActive }
        if conditions == [.power] { return powerActive }
        return automationActive
    }
}

struct KeepAwakeDisplaySleepStrings {
    let allowDisplaySleep: String
    let allowDisplaySleepCaption: String
}

extension FeatureStrings {
    static func keepAwakeAutomation(_ language: AppLanguage) -> KeepAwakeAutomationStrings {
        switch language {
        case .enUS: return .enUS
        }
    }

    static func keepAwakeDisplaySleep(_ language: AppLanguage) -> KeepAwakeDisplaySleepStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension KeepAwakeDisplaySleepStrings {
    static let enUS = KeepAwakeDisplaySleepStrings(
        allowDisplaySleep: "Allow the display to sleep",
        allowDisplaySleepCaption: "Keeps the Mac awake while the display follows its normal sleep timer."
    )

}

extension KeepAwakeAutomationStrings {
    static let enUS = KeepAwakeAutomationStrings(
        automationSection: "Automation",
        automationCaption: "Starts when any selected condition is active.",
        automationOff: "Off",
        externalDisplayToggle: "External display",
        externalDisplayActive: "Active while an external display is connected",
        powerToggle: "Power",
        powerActive: "Active while connected to power",
        automationActive: "Active because an automatic condition is met"
    )

}
