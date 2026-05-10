// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct SuperKeyStrings {
    let pageTitle: String
    let hubDescription: String
    let enableToggle: String
    let enableCaption: String
    let capsLockKey: String
    let holdHint: String
    let soloSection: String
    let soloCaption: String
    let soloNothing: String
    let soloCapsLock: String
    let soloEscape: String
    let activeNow: String
    let panelCaptionFormat: String
    let manageButton: String
    let soloInputSource: String
}

extension FeatureStrings {
    static func superKey(_ language: AppLanguage) -> SuperKeyStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension SuperKeyStrings {
    static let enUS = SuperKeyStrings(
        pageTitle: "Super key",
        hubDescription: "Turns Caps Lock into the modifier combination you choose.",
        enableToggle: "Use Caps Lock as the super key",
        enableCaption: "Hold it and press any key. Choose one or more modifiers below.",
        capsLockKey: "Caps Lock",
        holdHint: "Hold",
        soloSection: "A tap on its own",
        soloCaption: "What a quick tap does when no other key is pressed.",
        soloNothing: "Nothing",
        soloCapsLock: "Turn capitals on and off",
        soloEscape: "Press Escape",
        activeNow: "Working now",
        panelCaptionFormat: "Caps Lock holds %@.",
        manageButton: "Set up…",
        soloInputSource: "Switch input source; hold for Caps Lock"
    )

}
