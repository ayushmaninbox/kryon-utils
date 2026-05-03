// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct FanControlFeatureStrings {
    let title: String
    let hubDescription: String
    let showInPanel: String
    let settingsCaption: String
    let fanNameFormat: String
    let rpmFormat: String
    let allowControl: String
    let approvalCaption: String
    let openSettings: String
    let noFans: String
    let unsupported: String
    let alreadyControlled: String
    let failed: String
    let safetyCaption: String
    let safetyStopped: String
    let menuBarTitle: String
    let systemControl: String
    let manualControl: String
    let customCurve: String
    let mode: String
    let coolingIntensity: String
    let currentRPMFormat: String
    let targetRPMFormat: String
    let applyManual: String
    let applyCurve: String
    let returnToSystem: String
    let temperatureUnavailable: String
    let curveUnavailable: String
    let sensor: String
    let temperature: String
    let fanSpeed: String
    let addPoint: String
    let addSensor: String
    let removePoint: String
    let removeSensor: String
    let curveGraph: String
    let averageSoC: String
    let hottestSoC: String
    let averageCPU: String
    let hottestCPU: String
    let hottestGPU: String
}

extension FeatureStrings {
    static func fanControl(_ language: AppLanguage) -> FanControlFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension FanControlFeatureStrings {
    static let enUS = FanControlFeatureStrings(
        title: "Fan Control",
        hubDescription: "Control fans manually or with temperature curves while seeing live and target RPM",
        showInPanel: "Show Fan Control in the panel",
        settingsCaption: "Adds manual fan speeds and temperature curves to the menu bar panel.",
        fanNameFormat: "Fan %d",
        rpmFormat: "%d RPM",
        allowControl: "Allow fan control",
        approvalCaption: "Allow Kryon in Login Items to use the protected fan controller.",
        openSettings: "Open System Settings",
        noFans: "This Mac has no controllable fan.",
        unsupported: "Fan control is not available on this Mac.",
        alreadyControlled: "Another process is controlling the fans. Return it to system control first.",
        failed: "The fans returned to system control because the requested control could not be verified.",
        safetyCaption: "Control stays active until you return to System. It returns automatically if the app disconnects, the Mac sleeps, sensor readings fail or thermal pressure rises.",
        safetyStopped: "Returned to system control because fan control was interrupted.",
        menuBarTitle: "Fan speed",
        systemControl: "System",
        manualControl: "Manual",
        customCurve: "Curve",
        mode: "Control mode",
        coolingIntensity: "Fan speed",
        currentRPMFormat: "Current %d RPM",
        targetRPMFormat: "Target %d RPM",
        applyManual: "Apply manual control",
        applyCurve: "Apply fan curve",
        returnToSystem: "Use system control",
        temperatureUnavailable: "The selected temperature sensor stopped responding. Fan control returned to System.",
        curveUnavailable: "A selected temperature sensor is not available on this Mac.",
        sensor: "Temperature sensor",
        temperature: "Temperature",
        fanSpeed: "Fan speed",
        addPoint: "Add point",
        addSensor: "Add sensor",
        removePoint: "Remove point",
        removeSensor: "Remove sensor",
        curveGraph: "Temperature and fan speed curve",
        averageSoC: "Average SoC",
        hottestSoC: "Hottest SoC",
        averageCPU: "Average CPU",
        hottestCPU: "Hottest CPU",
        hottestGPU: "Hottest GPU"
    )

}
