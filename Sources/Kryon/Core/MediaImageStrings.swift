// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Foundation

struct MediaImageConverterStrings {
    let filesSelectedFormat: String
    let profile: String
    let noProfile: String
    let profileName: String
    let saveAsNew: String
    let updateProfile: String
    let deleteProfile: String
    let profileModified: String
    let profileDefaultNameFormat: String
    let presetWeb: String
    let presetSocial: String
    let presetDocs: String
    let resize: String
    let resizeNone: String
    let resizeMax: String
    let resizeWidth: String
    let resizeHeight: String
    let resizeExact: String
    let exactStretch: String
    let exactFit: String
    let exactFill: String
    let height: String
    let watermark: String
    let watermarkOff: String
    let watermarkText: String
    let watermarkLogo: String
    let watermarkBoth: String
    let watermarkTextPlaceholder: String
    let noLogo: String
    let chooseLogo: String
    let position: String
    let topLeft: String
    let topRight: String
    let center: String
    let bottomLeft: String
    let bottomRight: String
    let opacity: String
    let margin: String
    let scale: String
    let rename: String
    let preview: String
    let outputName: String
    let background: String
    let backgroundTransparent: String
    let backgroundWhite: String
    let backgroundBlack: String
    let preserveDate: String
    let moreOptions: String
    let tooLarge: String
    let copySummary: String
    let savedBytesFormat: String
    let grewBytesFormat: String
    let batchSavedFormat: String
    let batchPartialFormat: String
    let batchSummaryHeaderFormat: String
    let batchSummaryItemFormat: String

    static func localized(_ language: AppLanguage) -> MediaImageConverterStrings {
        switch language {
        case .enUS: return .enUS
        }
    }
}

extension MediaImageConverterStrings {
    static let enUS = MediaImageConverterStrings(
        filesSelectedFormat: "%d files selected",
        profile: "Profile",
        noProfile: "No profile",
        profileName: "Profile name",
        saveAsNew: "Save new",
        updateProfile: "Update",
        deleteProfile: "Delete profile",
        profileModified: "Modified",
        profileDefaultNameFormat: "Profile %d",
        presetWeb: "Web",
        presetSocial: "Social",
        presetDocs: "Docs",
        resize: "Resize",
        resizeNone: "No change",
        resizeMax: "Max side",
        resizeWidth: "Width",
        resizeHeight: "Height",
        resizeExact: "Custom",
        exactStretch: "Stretch",
        exactFit: "Fit",
        exactFill: "Fill",
        height: "Height",
        watermark: "Watermark",
        watermarkOff: "Off",
        watermarkText: "Text",
        watermarkLogo: "Logo",
        watermarkBoth: "Text + logo",
        watermarkTextPlaceholder: "Watermark text",
        noLogo: "No logo",
        chooseLogo: "Choose logo",
        position: "Position",
        topLeft: "Top left",
        topRight: "Top right",
        center: "Center",
        bottomLeft: "Bottom left",
        bottomRight: "Bottom right",
        opacity: "Opacity",
        margin: "Margin",
        scale: "Scale",
        rename: "Rename",
        preview: "Preview",
        outputName: "Output",
        background: "Background",
        backgroundTransparent: "Transparent",
        backgroundWhite: "White",
        backgroundBlack: "Black",
        preserveDate: "Keep original modified date",
        moreOptions: "More options",
        tooLarge: "These dimensions are too large to process safely. Choose a smaller size.",
        copySummary: "Copy summary",
        savedBytesFormat: "%@ saved",
        grewBytesFormat: "%@ larger",
        batchSavedFormat: "%d images saved",
        batchPartialFormat: "%d saved, %d failed",
        batchSummaryHeaderFormat: "%d saved, %d failed",
        batchSummaryItemFormat: "%@ -> %@"
    )

}
