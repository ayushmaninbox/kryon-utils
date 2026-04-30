// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct BatteryTimeFeatureStrings {
    let title: String
    let systemEstimate: String
    let calculating: String
}

extension FeatureStrings {
    static func batteryTime(_ language: AppLanguage) -> BatteryTimeFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension BatteryTimeFeatureStrings {
    static let enUS = BatteryTimeFeatureStrings(
        title: "Battery time remaining",
        systemEstimate: "System estimate",
        calculating: "Calculating…"
    )

}
