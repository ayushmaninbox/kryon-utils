// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

/// Strings for the display brightness feature. Same contract as the other
/// FeatureStrings structs: memberwise init in declaration order, one static
/// per language, all in this file.
struct BrightnessFeatureStrings {
    let pageTitle: String
    let hubDescription: String
    let enable: String
    let enableCaption: String
    let externalCaption: String
    let noDisplays: String
    let displayOff: String
    let turnOffDisplay: String
    let turnOnDisplay: String
    let lastDisplayCaption: String
    let switchUnavailable: String
    let switchFailed: String
    let keysToggle: String
    let keysCaption: String
    let osdToggle: String
    let osdCaption: String
    let keyboardLight: String
    let keyboardLightCaption: String
}

extension FeatureStrings {
    static func brightness(_ language: AppLanguage) -> BrightnessFeatureStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension BrightnessFeatureStrings {
    static let enUS = BrightnessFeatureStrings(
        pageTitle: "Displays",
        hubDescription: "Brightness and power controls for every display",
        enable: "Control displays",
        enableCaption: "Brightness and on or off controls for the built-in screen and external monitors, here and in the menu bar panel.",
        externalCaption: "External monitors are adjusted through the same protocol as their own buttons. When the connection cannot carry it, as with HDMI adapters, the slider dims the picture instead, so brightness control works either way.",
        noDisplays: "No display found.",
        displayOff: "Off",
        turnOffDisplay: "Turn off display",
        turnOnDisplay: "Turn on display",
        lastDisplayCaption: "At least one display must stay on.",
        switchUnavailable: "Display switching is unavailable on this Mac.",
        switchFailed: "Could not change this display.",
        keysToggle: "Brightness keys follow the pointer",
        keysCaption: "The keyboard brightness keys change the display under the pointer.",
        osdToggle: "Show brightness when adjusting",
        osdCaption: "Shows the brightness percentage when you use the brightness keys or sliders.",
        keyboardLight: "Keyboard light",
        keyboardLightCaption: "Turns the keyboard backlight on or off."
    )

}
