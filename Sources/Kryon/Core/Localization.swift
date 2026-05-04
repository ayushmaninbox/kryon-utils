// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import Combine
import Foundation

/// The interface is English-only.
enum AppLanguage: String, CaseIterable, Identifiable {
    case enUS = "en-US"

    var id: String { rawValue }

    /// The language's own name, shown in its own script, the way macOS lists them.
    var displayName: String {
        "English (US)"
    }

    static var systemDefault: AppLanguage { .enUS }
}

/// Source of every user-facing string. Views observe this object so the whole
/// interface re-renders immediately when the language changes.
final class L10n: ObservableObject {
    static let shared = L10n()

    @Published var language: AppLanguage {
        didSet { UserDefaults.standard.set(language.rawValue, forKey: DefaultsKey.language) }
    }

    var s: Strings {
        switch language {
        case .enUS: return .enUS
        }
    }

    private init() {
        if let raw = UserDefaults.standard.string(forKey: DefaultsKey.language),
           let saved = AppLanguage(rawValue: raw) {
            language = saved
        } else {
            language = .systemDefault
        }
    }
}

/// Flat, compiler-checked catalog of UI strings. Adding a field here forces
/// both translations to be provided.
struct Strings {
    // MARK: Menu bar & context menu
    let statusIdleTooltip: String
    let statusActiveUntil: String      // + time
    let statusActiveIndefinite: String
    let menuEnableAwake: String
    let menuDisableAwake: String
    let menuActivateFor: String
    let menuSettings: String
    let menuAbout: String
    let menuQuit: String
    // Standard application menu bar (App / Edit / Window) shown while one of the
    // app's own windows is focused. Without it, an accessory app has no main menu
    // and the standard shortcuts (Cmd+H/M/W/Q, Cmd+C/V/X/A) do nothing.
    let menuHide: String
    let menuHideOthers: String
    let menuShowAll: String
    let menuEdit: String
    let menuUndo: String
    let menuRedo: String
    let menuCut: String
    let menuCopy: String
    let menuPaste: String
    let menuSelectAll: String
    let menuWindow: String
    let menuMinimize: String
    let menuZoom: String
    let menuClose: String

    // MARK: Durations
    let minutes15: String
    let minutes30: String
    let hour1: String
    let hours2: String
    let hours4: String
    let hours8: String
    let indefinitely: String
    let indefinite: String

    // MARK: Panel — header & footer
    let panelSettings: String
    let panelQuit: String
    let panelHotkeyHint: String

    // MARK: Panel — keep awake card
    let keepAwakeTitle: String
    let keepAwakeEndsIn: String        // + remaining
    let keepAwakeUntilDisabled: String
    let keepAwakeNormalRules: String
    let keepAwakeOptions: String
    let keepAwakeMouseJiggle: String
    let keepAwakeMouseJiggleCaption: String
    let keepAwakeMouseJiggleInterval: String
    let keepAwakeActiveIconLabel: String
    let keepAwakeActiveIconKryon: String
    let keepAwakeActiveIconCoffee: String
    let keepAwakeActiveIconEye: String
    let keepAwakeActiveIconMoon: String
    let keepAwakeActiveIconLight: String
    let keepAwakeIconTintLabel: String
    let keepAwakeIconTintOrange: String
    let keepAwakeIconTintGreen: String
    let keepAwakeIconTintBlue: String
    let keepAwakeIconTintPurple: String
    let keepAwakeIconTintPink: String
    let keepAwakeIconTintNone: String
    let durationLabel: String
    let clamshellTitle: String
    let clamshellOnCaption: String
    let clamshellNeedsSession: String
    let clamshellReady: String
    let clamshellNeedsPassword: String

    // MARK: Panel — system monitor
    let systemSection: String
    let temperatures: String
    let cpuLabel: String
    let gpuLabel: String
    let batteryLabel: String
    let usageSection: String
    let memorySection: String
    let memoryPressure: String
    let memorySwapUsed: String
    let memoryCompressed: String
    let memoryCachedFiles: String
    let pressureNormal: String
    let pressureWarning: String
    let pressureCritical: String
    let monitorUnavailable: String
    let energyAppsTitle: String
    let energyAppsIdle: String

    // MARK: Notifications
    let notifySessionEndedTitle: String
    let notifySessionEndedBody: String
    let notifyBatteryTitle: String
    let notifyBatteryBody: String

    // MARK: Administrator prompts (shown by macOS password dialogs)
    let adminPromptClamshellOn: String
    let adminPromptClamshellOff: String
    let adminPromptRecover: String
    let adminPromptUpdate: String
    let adminPromptSudoersInstall: String
    let adminPromptSudoersRemove: String

    // MARK: Settings — window & tabs
    let settingsTitle: String
    let tabGeneral: String
    let tabEnergy: String
    let tabMouse: String
    let tabSwitcher: String
    let tabAdvanced: String
    let tabAbout: String
    let tabReleaseNotes: String
    let releaseNotesOnUpdateToggle: String
    let whatsNewDontShowAgain: String
    let previewSizeLabel: String
    let previewSizeNormal: String
    let previewSizeLarge: String
    let previewSizeXLarge: String
    let settingsGroupFeatures: String

    // MARK: Settings — advanced
    let advancedResetSection: String
    let advancedResetDescription: String
    let advancedClearButton: String
    let advancedCleared: String
    let advancedClearConfirmTitle: String
    let advancedClearConfirmBody: String
    let advancedUninstallSection: String
    let advancedUninstallDescription: String
    let advancedUninstallButton: String
    let advancedUninstallConfirmTitle: String
    let advancedUninstallConfirmBody: String

    // MARK: Settings — general
    let launchAtLogin: String
    let languageLabel: String
    let menuBarSection: String
    let showCountdown: String
    let globalHotkeySection: String
    let hotkeyToggle: String
    let hotkeyCaption: String

    // MARK: Settings — energy
    let sessionSection: String
    let defaultDurationLabel: String
    let keepAwakeAutoStart: String
    let keepAwakeAutoStartCaption: String
    let batteryProtectionSection: String
    let batteryDisableBelow: String
    let batteryNever: String
    let batteryProtectionCaption: String
    let clamshellSection: String
    let configuring: String
    let sudoersFailed: String
    let clamshellExplanation: String

    // MARK: Settings — mouse
    let scrollSection: String
    let invertMouseScroll: String
    let invertMouseScrollCaption: String
    let scrollTrackpadNote: String
    let scrollActiveNow: String
    let mouseNavigationActiveNow: String
    let smoothScrollName: String
    let smoothScrollCaption: String
    let smoothScrollStepLabel: String
    let mouseNavigationSection: String
    let mouseNavigationEnable: String
    let mouseNavigationCaption: String
    let middleClickSection: String
    let middleClickEnable: String
    let middleClickEnableCaption: String
    let middleClickDragConflict: String
    let middleClickTapPicker: String
    let middleClickTapOff: String
    let middleClickTapThreeFingers: String
    let middleClickTapFourFingers: String
    let middleClickTapCaption: String
    let quickToolsTab: String
    let quickToolShortcutToggle: String
    let ocrName: String
    let ocrCaption: String
    let ocrCopied: String
    let ocrNoText: String
    let colorPickerName: String
    let colorPickerCaption: String
    let colorPickerFormatLabel: String
    let colorPickerBareHexToggle: String
    let colorPickerPickNow: String
    let micMuteName: String
    let micUnmuteName: String
    let micMuteCaption: String
    let micMutedHUD: String
    let micUnmutedHUD: String
    let micMuteMenuBarToggle: String
    let micMuteMenuBarCaption: String
    let pastePlainName: String
    let pastePlainCaption: String
    let launcherName: String
    let launcherCaption: String
    let launcherOpenNow: String
    let launcherEditHint: String
    let launcherEmptyState: String
    let launcherAddSection: String
    let launcherKeysHint: String

    // MARK: Settings — switcher
    let switcherSection: String
    let switcherEnable: String
    let switcherEnableCaption: String
    let switcherUsageHint: String
    let switcherNoWindows: String
    let switcherIconRowMode: String
    let switcherIconRowModeCaption: String
    let switcherSimpleMode: String
    let switcherSimpleModeCaption: String
    let switcherShortcutHintApps: String
    let switcherShortcutHintWindows: String
    let switcherWindowShortcutCaption: String
    let switcherMergeTabs: String
    let switcherMergeTabsCaption: String
    let switcherWindowlessApps: String
    let switcherWindowlessAppsCaption: String
    let switcherWindowlessAppsOff: String
    let switcherWindowlessAppsFinder: String
    let switcherWindowlessAppsAll: String
    let switcherNoOpenWindow: String
    let switcherOtherDesktop: String
    let dockPreviewName: String
    let dockPreviewEnable: String
    let dockPreviewEnableCaption: String
    let dockPreviewBackgroundOpacity: String
    let dockPreviewBackgroundOpacityCaption: String
    let dockPreviewOpenDelay: String
    let dockPreviewOpenDelayCaption: String
    let dockClickMinimize: String
    let dockClickMinimizeCaption: String
    let dockClickCycleWindows: String
    let dockClickCycleWindowsCaption: String
    let dockPreviewActiveNow: String
    let dockPreviewDockUnavailable: String
    let dockPreviewAutohideBeta: String
    let dockPreviewOpenWindow: String
    let dockPreviewCloseWindow: String
    let dockPreviewMinimizeWindow: String
    let dockPreviewRestoreWindow: String
    let dockPreviewPinPanel: String
    let dockPreviewUnpinPanel: String
    let dockPreviewPinned: String
    let dockPreviewClosePanel: String
    let dockPreviewPreviousWindow: String
    let dockPreviewNextWindow: String

    // MARK: Feature — cut & paste in Finder
    let cutPasteName: String
    let cutPasteEnable: String
    let cutPasteEnableCaption: String
    let cutPasteHowTitle: String
    let cutPasteStep1: String
    let cutPasteStep2: String
    let cutPasteTextNote: String
    let cutPasteActiveNow: String
    let cutPasteAutomationNote: String
    let cutReadyTitle: String
    let cutReadyHint: String
    let cutCancel: String
    let cutDoneTitle: String
    let cutMovedSingular: String
    let cutMovedPluralFormat: String      // + count
    let cutSomeFailed: String
    let cutMovingTitle: String
    let cutMovingCountFormat: String      // + position, total

    // MARK: Feature — quit on last window close
    let autoQuitName: String
    let autoQuitEnable: String
    let autoQuitEnableCaption: String
    let autoQuitActiveNow: String
    let autoQuitHowTitle: String
    let autoQuitStep1: String
    let autoQuitStep2: String
    let autoQuitPredictableNote: String
    let autoQuitExceptionsTitle: String
    let autoQuitExceptionsCaption: String
    let autoQuitExceptionsEmpty: String
    let autoQuitAddApp: String

    // MARK: Feature — complete app uninstaller
    let uninstallerName: String
    let uninstallerEnableCaption: String
    let uninstallerStep1: String
    let uninstallerStep2: String
    let uninstallerStep3: String
    let uninstallerMenuItem: String
    let uninstallerDropTitle: String
    let uninstallerDropSubtitle: String
    let uninstallerChoose: String
    let uninstallerPickerTitle: String
    let uninstallerPickerSearch: String
    let uninstallerPickerEmpty: String
    let uninstallerEmptyNote: String
    let uninstallerFDANote: String
    let uninstallerFDAGrant: String
    let uninstallerFDAHint: String
    let uninstallerFDARelaunch: String
    let uninstallerScanning: String
    let uninstallerRemoving: String
    let uninstallerFoundTitle: String
    let uninstallerSelectedFormat: String   // + selected, total
    let uninstallerRemove: String
    let uninstallerCancel: String
    let uninstallerDoneTitle: String
    let uninstallerFreedFormat: String      // + size string
    let uninstallerSomeFailed: String
    let uninstallerAnother: String
    let uninstallerCatApp: String
    let uninstallerCatSupport: String
    let uninstallerCatCaches: String
    let uninstallerCatPreferences: String
    let uninstallerCatContainers: String
    let uninstallerCatLogs: String
    let uninstallerCatState: String
    let uninstallerCatOther: String

    // MARK: Feature — URL cleaner
    let urlCleanerName: String
    let urlCleanerEnable: String
    let urlCleanerEnableCaption: String
    let urlCleanerActiveNow: String
    let urlCleanerManualTitle: String
    let urlCleanerInputPlaceholder: String
    let urlCleanerOutputPlaceholder: String
    let urlCleanerCleanButton: String
    let urlCleanerPasteButton: String
    let urlCleanerCopyButton: String
    let urlCleanerClearButton: String
    let urlCleanerNoURL: String
    let urlCleanerNoChange: String
    let urlCleanerCleaned: String
    let urlCleanerCopied: String
    let urlCleanerLocalNote: String

    // MARK: Feature — Homebrew manager
    let homebrewName: String
    let homebrewEnableCaption: String
    let homebrewMissingTitle: String
    let homebrewMissingBody: String
    let homebrewInstallHomebrew: String
    let homebrewInstallHomebrewCaption: String
    let homebrewInstallHomebrewOpened: String
    let homebrewShellSetupTitle: String
    let homebrewShellSetupBody: String
    let homebrewShellSetupButton: String
    let homebrewShellSetupOpened: String
    let homebrewRefresh: String
    let homebrewCheckPackages: String
    let homebrewTrustTitle: String
    let homebrewTrustCaption: String
    let homebrewTrustButton: String
    let homebrewSearchPlaceholder: String
    let homebrewKeyboardHint: String
    let homebrewSearchButton: String
    let homebrewSearchResults: String
    let homebrewInstalled: String
    let homebrewAll: String
    let homebrewFormulas: String
    let homebrewCasks: String
    let homebrewNoPackages: String
    let homebrewNoSelection: String
    let homebrewDetailsTitle: String
    let homebrewInstall: String
    let homebrewUninstall: String
    let homebrewUpgrade: String
    let homebrewUpgradeAll: String
    let homebrewUpdateHomebrew: String
    let homebrewAllPackages: String
    let homebrewOpenTerminal: String
    let homebrewCancelOperation: String
    let homebrewClearLog: String
    let homebrewLogTitle: String
    let homebrewVersion: String
    let homebrewDescription: String
    let homebrewHomepage: String
    let homebrewPopularity: String
    let homebrewPopularityFormat: String
    let homebrewInstalledBadge: String
    let homebrewNotInstalledBadge: String
    let homebrewUpdates: String
    let homebrewUpdateAvailableBadge: String
    let homebrewLatestVersion: String
    let homebrewConfirmInstallTitle: String
    let homebrewConfirmInstallBodyFormat: String
    let homebrewConfirmUninstallTitle: String
    let homebrewConfirmUninstallBodyFormat: String
    let homebrewConfirmUpgradeTitle: String
    let homebrewConfirmUpgradeBodyFormat: String
    let homebrewConfirmUpgradeAllTitle: String
    let homebrewConfirmUpgradeAllBody: String
    let homebrewConfirmUpdateHomebrewTitle: String
    let homebrewConfirmUpdateHomebrewBody: String
    let homebrewTerminalFallback: String
    let homebrewLoading: String
    let homebrewSearchEmpty: String
    let homebrewOperationInstallFormat: String
    let homebrewOperationUninstallFormat: String
    let homebrewOperationUpgradeFormat: String
    let homebrewOperationUpgradeAll: String
    let homebrewOperationUpdateHomebrew: String
    let homebrewOperationInstalledFormat: String
    let homebrewOperationUninstalledFormat: String
    let homebrewOperationUpgradedFormat: String
    let homebrewOperationUpgradedAll: String
    let homebrewOperationUpdatedHomebrew: String
    let homebrewOperationFailedFormat: String
    let homebrewOperationCancelled: String
    let homebrewOperationPreparing: String
    let homebrewOperationDownloading: String
    let homebrewOperationInstalling: String
    let homebrewOperationUninstalling: String
    let homebrewOperationUpgrading: String
    let homebrewOperationFinalizing: String
    let homebrewOperationRefreshing: String
    let homebrewOperationTerminal: String
    let homebrewOperationElapsedFormat: String
    let homebrewOperationShowDetails: String
    let homebrewOperationHideDetails: String
    let homebrewOperationTechnicalLog: String
    let homebrewOperationProgressUnknown: String

    // MARK: Feature — local media tools
    let mediaName: String
    let mediaEnableCaption: String
    let mediaLocalNote: String
    let mediaToolVideo: String
    let mediaToolGIF: String
    let mediaToolImage: String
    let mediaToolText: String
    let mediaSelectFile: String
    let mediaDropHint: String
    let mediaOutput: String
    let mediaOutputAutomatic: String
    let mediaChooseOutput: String
    let mediaStartVideo: String
    let mediaStartGIF: String
    let mediaStartImage: String
    let mediaStartConvertPDF: String
    let mediaStartText: String
    let mediaCancel: String
    let mediaStartTime: String
    let mediaEndTime: String
    let mediaQuality: String
    let mediaCompressionLow: String
    let mediaCompressionMedium: String
    let mediaCompressionHigh: String
    let mediaMaxSize: String
    let mediaWidth: String
    let mediaFPS: String
    let mediaKeepAudio: String
    let mediaCodec: String
    let mediaFormat: String
    let mediaStripMetadata: String
    let mediaLoopGIF: String
    let mediaOCRMode: String
    let mediaOCRAccurate: String
    let mediaOCRFast: String
    let mediaLanguageCorrection: String
    let mediaTextOutputNote: String
    let mediaRunning: String
    let mediaCompleted: String
    let mediaCancelled: String
    let mediaOpenInFinder: String
    let mediaCopyText: String
    let mediaRunAgain: String
    let mediaEmptyText: String
    let mediaResultSavedFormat: String
    let mediaResultSizeFormat: String
    let mediaResultGrewCaption: String
    let mediaErrorNoFile: String
    let mediaErrorNoVideo: String
    let mediaErrorSameOutput: String
    let mediaErrorUnsupported: String

    // MARK: Feature — temporary shelf
    let shelfName: String
    let shelfEnable: String
    let shelfEnableCaption: String
    let shelfHowTitle: String
    let shelfStep1: String
    let shelfStep2: String
    let shelfStep3: String
    let shelfShakeToggle: String
    let shelfShakeCaption: String
    let shelfDropZoneToggle: String
    let shelfDropZoneCaption: String
    let shelfDropZoneLabel: String
    let shelfCollapse: String
    let shelfBehaviorTitle: String
    let shelfCloseAfterDrop: String
    let shelfCloseAfterDropCaption: String
    let shelfRemoveAfterDrop: String
    let shelfRemoveAfterDropCaption: String
    let shelfExclusionsTitle: String
    let shelfExclusionsEmpty: String
    let shelfExclusionsCaption: String
    let shelfPin: String
    let shelfUnpin: String
    let extraBrightnessName: String
    let extraBrightnessCaption: String
    let extraBrightnessLevelLabel: String
    let extraBrightnessUnsupported: String
    let shelfHotkeyLabel: String
    let shelfOpenNow: String
    let shelfNoPermission: String
    let shelfMenuItem: String
    let shelfTitle: String
    let shelfEmpty: String
    let shelfClearAll: String
    let shelfRemoveSelected: String
    let shelfSelectedFormat: String      // + count
    let shelfHint: String
    let shelfItemImage: String
    let shelfTooltipItemsFormat: String      // + count, always plural: a pile always has 2+
    let shelfTooltipImageSingular: String    // + count == 1
    let shelfTooltipImagePlural: String      // + count
    let shelfTooltipFileSingular: String     // + count == 1
    let shelfTooltipFilePlural: String       // + count
    let shelfTooltipNoteSingular: String     // + count == 1
    let shelfTooltipNotePlural: String       // + count
    let shelfTooltipLinkSingular: String     // + count == 1
    let shelfTooltipLinkPlural: String       // + count
    let shelfActionOpen: String
    let shelfActionOpenWith: String
    let shelfActionAirDrop: String

    // MARK: Panel — per-app breakdown
    let breakdownMeasuring: String

    // MARK: Panel — volume mixer
    let mixerSection: String
    let mixerEmpty: String
    let mixerUnavailable: String
    let mixerPermissionBody: String
    let mixerResetTooltip: String
    let mixerOutputDefault: String
    let mixerOutputCurrent: String
    let mixerOutputUnavailable: String
    let mixerOutputFallback: String
    let mixerBypassedCaption: String
    let mixerOutputTooltip: String
    let mixerSystemOutputTitle: String
    let mixerSystemOutputNoDevices: String
    let mixerSystemOutputTooltip: String
    let mixerSystemOutputErrorFormat: String
    let mixerLowerOnHeadphonesDisconnect: String
    let mixerLowerOnHeadphonesDisconnectCaption: String
    let mixerHeadphonesDisconnectVolume: String
    let soundOutputSwitcherTitle: String
    let soundOutputSwitcherEnable: String
    let soundOutputSwitcherCaption: String
    let soundOutputSwitcherDevices: String
    let soundOutputSwitcherNoAvailableSelection: String
    let mixerInputTitle: String
    let mixerInputNoDevices: String
    let mixerInputUnavailable: String
    let mixerInputFallback: String
    let mixerInputTooltip: String
    let mixerInputErrorFormat: String
    let mixerVisibleApps: String
    let mixerAllShown: String
    let mixerHiddenCountLabel: String
    let mixerHideFromList: String

    // MARK: Settings — updates
    let updatesSection: String
    let autoCheckToggle: String
    let includeBetaUpdatesToggle: String
    let includeBetaUpdatesCaption: String
    let betaBadgeLabel: String
    let checkNowButton: String
    let updateChecking: String
    let updateUpToDate: String
    let updateAvailablePrefix: String  // + version
    let updateInstallButton: String
    let updateDownloading: String
    let updateInstalling: String
    let updateFailedPrefix: String
    let updateLastChecked: String
    let updateNotifyTitle: String
    let updateInstallFailedBody: String
    let updateNeedsApplicationsTitle: String
    let updateNeedsApplicationsBody: String
    let menuCheckUpdates: String

    // MARK: Permissions (shared by Settings & onboarding)
    let permissionRequired: String
    let permissionAccessibility: String
    let permissionScreenRecording: String
    let permissionGranted: String
    let permissionMissing: String
    let permissionOpenSettings: String
    let permissionRequest: String
    let permissionRestartNote: String

    // MARK: About
    let aboutDescription: String
    let versionPrefix: String
    let reviewIntro: String
    let reviewHighlights: String
    let viewOnGitHub: String

    // MARK: Onboarding
    let obContinue: String
    let obBack: String
    let obSkipStep: String
    let obStart: String
    let obStepWelcomeTitle: String
    let obStepWelcomeBody: String
    let obWelcomeBullet1Title: String
    let obWelcomeBullet1Body: String
    let obWelcomeBullet2Title: String
    let obWelcomeBullet2Body: String
    let obWelcomeBullet3Title: String
    let obWelcomeBullet3Body: String
    let obLanguageLabel: String
    let obStepAccessibilityTitle: String
    let obStepAccessibilityBody: String
    let obAccessibilityWhy: String
    let obStepRecordingTitle: String
    let obStepRecordingBody: String
    let obRecordingWhy: String
    let obStepMonitorTitle: String
    let obStepMonitorBody: String
    let obMonitorNoPermission: String
    let obStepOptionalTitle: String
    let obStepOptionalBody: String
    let obStepStatusTitle: String
    let obStepStatusBody: String
    let obStatusRecheck: String
    let obStepDoneTitle: String
    let obStepDoneBody: String
    let obDoneHint: String
    let obWhatsNewTitle: String
    let obWhatsNewFallback: String
    let obLanguageUpdateTitle: String
    let obLanguageUpdateBody: String
    let obPurposeTitle: String
    let obPurposeBody: String
    let obPurposeSkip: String

    // MARK: Settings — monitor / menu bar metrics
    let tabMonitor: String
    let monitorMenuBarSection: String
    let monitorMenuBarCaption: String
    let monitorCombineTemperatures: String
    let monitorCombineTemperaturesCaption: String
    let monitorSeparateMenuBarMetrics: String
    let monitorSeparateMenuBarMetricsCaption: String
    let monitorNetworkUploadFirst: String
    let monitorShowCPU: String
    let monitorShowMemory: String
    let monitorShowNetwork: String
    let monitorShowPowerLabel: String
    let monitorIntervalLabel: String
    let monitorInterval1: String
    let monitorInterval2: String
    let monitorInterval5: String
    let monitorPanelSection: String
    let panelNavigationMode: String
    let panelNavigationCaption: String
    let panelFooterSections: String
    let panelFooterList: String
    let betaBadge: String
    let betaFeatureWarning: String

    // MARK: Panel — network
    let networkSection: String
    let networkDownload: String
    let networkUpload: String
    let networkThisSession: String
    let networkMeasuring: String
    let networkApps: String
    let networkAppsIdle: String

    // MARK: Panel — disk
    let diskSection: String
    let diskUsed: String
    let diskFree: String
    let diskInternal: String
    let diskExternal: String
    let diskSelect: String
    let diskRead: String
    let diskWrite: String
    let diskSMARTStatus: String
    let diskSMARTUnavailable: String
    let diskTotalRead: String
    let diskTotalWritten: String
    let diskTemperature: String
    let diskHealth: String
    let diskPowerCycles: String
    let diskPowerOnHours: String
    let diskUnsafeShutdowns: String
    let diskMediaErrors: String
    let diskEject: String
    let diskEjectAll: String
    let diskEjecting: String
    let diskReadyToRemove: String
    let diskEjectFailed: String
    let diskProtectionCaption: String
    let diskNoExternal: String
    let diskOpenInFinder: String
    let diskStorageSettings: String
    let diskNoDisks: String

    // MARK: Panel — power
    let powerSection: String
    let powerSystem: String
    let powerAdapter: String
    let powerBattery: String
    let powerCharging: String
    let powerOnBattery: String
    let powerPluggedIn: String
    let powerUnavailable: String
    let powerAdapterMaxFormat: String   // + rated watts, e.g. "30 W max"
    let monitorShowGPU: String
    let monitorShowCPUTemperature: String
    let monitorShowGPUTemperature: String
    let monitorShowBatteryTemperature: String
    let monitorShowPeripheralBattery: String
    let peripheralBatteryNoDevices: String
    let monitorGraphsSection: String
    let monitorGraphsCaption: String

    // MARK: Update notification + onboarding menu bar setup
    let updateBannerTitle: String
    let updateBannerAction: String
    let obStepMenuBarTitle: String
    let obStepMenuBarBody: String
    let obStepMenuBarNote: String
    let monitorMenuBarPresetLabel: String
    let menuBarPresetReadable: String
    let menuBarPresetDense: String
    let menuBarSpacingLabel: String
    let menuBarSpacingStandard: String
    let menuBarSpacingCompact: String
    let menuBarHideIconToggle: String
    let menuBarHideIconCaption: String
    let monitorLabelStyleLabel: String
    let menuBarLabelStyleCompact: String
    let menuBarLabelStyleClassic: String
    let monitorMemoryStyleLabel: String
    let monitorMemoryPressureDot: String
    let memoryStyleDot: String
    let memoryStylePercent: String
    let memoryStyleBoth: String
    // MARK: System uptime, battery health, speed test
    let systemUptime: String
    let batteryCharge: String
    let powerHealth: String
    let powerCycles: String
    let speedTestRun: String
    let speedTestAgain: String
    let speedTestLatency: String
    let speedTestTesting: String
    let speedTestFailed: String

    // MARK: Per-item panel config (Settings + onboarding)
    let monitorShowInPanel: String
    let panelHideItem: String
    let panelShowItem: String
    let panelHiddenItem: String
    let monitorItemUptime: String
    let monitorItemNetSpeed: String
    let monitorItemNetTotals: String
    let monitorItemNetTest: String
    let monitorItemDiskUsage: String
    let monitorItemDiskActivity: String
    let monitorItemDiskSMART: String
    let monitorItemDiskProtection: String
    let monitorItemDiskTools: String
    let monitorPanelConfigHint: String
    let monitorOrderSection: String
    let monitorOrderHint: String
    let obStepPanelTitle: String
    let obStepPanelBody: String
    let obStepPanelNavigationTitle: String
    let obStepPanelNavigationBody: String

    // MARK: Cleaning mode
    let cleaningMenuItem: String
    let utilitiesSection: String
    let quickControlsSection: String
    let panelCategoryWindows: String
    let panelCategoryInput: String
    let panelCategoryFiles: String
    let windowMaximizeName: String
    let windowMaximizeCaption: String
    let windowMaximizeActiveNow: String
    let windowMaximizeNeedsAccessibility: String
    let keyDebounceName: String
    let keyDebounceEnable: String
    let keyDebounceCaption: String
    let keyDebounceActiveNow: String
    let keyDebounceGlobalWindow: String
    let keyDebouncePerKeySection: String
    let keyDebouncePerKeyCaption: String
    let keyDebounceKeyLabel: String
    let keyDebounceWindowLabel: String
    let keyDebounceAddKey: String
    let keyDebounceNoOverrides: String
    let keyDebounceRemoveKey: String
    let cleaningPanelCaption: String
    let cleaningOverlayTitle: String
    let cleaningOverlaySubtitle: String
    let cleaningOverlayUnlock: String
    let cleaningOverlayMouseHint: String
    let cleaningNeedsAxTitle: String
    let cleaningNeedsAxBody: String

    // MARK: Support / donate
    let tabSupport: String
    let shortcutsPageCaption: String
    let shortcutsPageTitle: String
    let settingsSearchPlaceholder: String
    let donateHeading: String
    let donateMessage: String
    let donateButton: String
    let donateThanks: String
    let supportIntroTitle: String
    let supportIntroMessage: String
    let supportIntroStarButton: String
    let supportIntroStarMessage: String
    let supportIntroCoffeeButton: String
    let supportIntroLaterButton: String
    let supportIntroDoneButton: String
    let discordIntroTitle: String
    let discordIntroMessage: String
    let discordIntroBenefitHelp: String
    let discordIntroBenefitFeedback: String
    let discordIntroBenefitPreviews: String
    let discordIntroJoinButton: String
    let communityIntroTitle: String
    let communityIntroMessage: String
    let communityIntroFollowButton: String
    let homebrewOfficialIntroTitle: String
    let homebrewOfficialIntroMessage: String
    let homebrewOfficialIntroInstallLabel: String
    let homebrewOfficialIntroMigrationTitle: String
    let homebrewOfficialIntroMigrationMessage: String
    let homebrewOfficialIntroCopyButton: String
    let updateShowcaseTitle: String
    let updateShowcaseMessage: String
    let updateShowcaseUnavailable: String
    let updateShowcaseRestart: String
    let showMenuBarIcon: String
    let showMenuBarIconCaption: String
    let menuBarIconStillHiddenTitle: String
    let menuBarIconStillHiddenBody: String
    let menuBarIconManagerHintFormat: String  // + manager name (twice)

    // MARK: Configurable shortcuts
    let shortcutRecording: String
    let shortcutReset: String
    let shortcutNone: String
    let shortcutClear: String
    let shortcutInvalid: String
    let shortcutPressKeys: String
    let shortcutEscapeHint: String
    let shortcutDeleteHint: String
    let shortcutNotCaptured: String
    let shortcutConflictFormat: String
    let shortcutUnavailable: String
    let shelfShortcutToggle: String
    let switcherUsageHintFormat: String

    // MARK: Media keys
    let musicBlockSection: String
    let musicBlockTitle: String
    let musicBlockCaption: String
    let musicBlockReplacementLabel: String
    let musicBlockReplacementNone: String
    let musicBlockChooseApp: String

    // MARK: Cleaner
    let cleanerName: String
    let cleanerIntroTitle: String
    let cleanerIntroCaption: String
    let cleanerScan: String
    let cleanerScanning: String
    let cleanerCleaning: String
    let cleanerCatLeftovers: String
    let cleanerCatLoginItems: String
    let cleanerCatCaches: String
    let cleanerCatLogs: String
    let cleanerCatDeveloper: String
    let cleanerCatTrash: String
    let cleanerLeftoversNote: String
    let cleanerLoginItemsNote: String
    let cleanerTrashNote: String
    let cleanerCatDeviceBackups: String
    let cleanerDeviceBackupsCaption: String
    let cleanerNothingFound: String
    let cleanerClean: String
    let cleanerDoneNote: String
    let cleanerAgain: String
    let cleanerRevealInFinder: String
    let cleanerPanelCaption: String
    let cleanerSafeSection: String
    let cleanerOptionalSection: String
    let cleanerCatOtherCaches: String
    let cleanerCachesCaption: String
    let cleanerLogsCaption: String
    let cleanerDeveloperCaption: String
    let cleanerLoginItemsCaption: String
    let cleanerLeftoversCaption: String
    let cleanerOtherCachesCaption: String
    let cleanerCleanSizeFormat: String      // + size string
    let cleanerScheduleTitle: String
    let cleanerScheduleOff: String
    let cleanerScheduleDaily: String
    let cleanerScheduleWeekly: String
    let cleanerScheduleCaption: String
    let cleanerScheduleLastFormat: String   // + size string
    let cleanerAutoNotificationFormat: String  // + size string
    let cleanerScheduleNextFormat: String   // + relative date and time
    let cleanerScheduleRanFormat: String    // + relative date and time
    let cleanerScheduleNotifyToggle: String
    let cleanerNotifDenied: String
    let cleanerNotifOpenSettings: String
    let launchAtLoginNeedsApplications: String
    let ocrQRToggle: String
    let ocrQRCaption: String
    let ocrQRCopied: String
    let qrResultTitle: String
    let qrResultCopy: String
    let qrResultOpen: String
    let highlightsTitle: String
    let highlightsTitleClipboardRedesign: String
    let highlightsCaptionDockPreview: String
    let highlightsCaptionScreenshot: String
    let highlightsCaptionSnippetLibrary: String
    let highlightsCaptionCapturePalette: String
    let highlightsCaptionClipboardRedesign: String
    let highlightsConfigure: String
    let highlightsTry: String
    let highlightsSeeAll: String
    let switcherCurrentSpaceOnly: String
    let switcherCurrentSpaceOnlyCaption: String
    let shelfFileMissing: String
    let previewSizeSmall: String
    let mixerSoundEffectsOutputTitle: String
    let mixerSoundEffectsOutputTooltip: String
    let monitorOpenActivityMonitor: String
    let dockClickHide: String
    let dockClickHideCaption: String
    let monitorMemoryMetricLabel: String
    let memoryMetricUsed: String
    let memoryMetricApp: String
    let keepAwakeRightClickToggle: String
    let keepAwakeRightClickToggleCaption: String
    let urlCleanerCustomTitle: String
    let urlCleanerCustomPlaceholder: String
    let urlCleanerCustomCaption: String
    let urlCleanerCustomSaveButton: String
    let switcherSearchPin: String
    let switcherSearchPinCaption: String
    let invertVerticalScroll: String
    let invertHorizontalScroll: String
    let switcherShowShortcutHints: String
    let switcherShowShortcutHintsCaption: String
    let uninstallerHomebrewPackageFormat: String
    let shelfEdgeToggle: String
    let shelfEdgeCaption: String
    let focusFollowsMouseName: String
    let focusFollowsMouseCaption: String
    let focusFollowsMouseDelay: String
}

// MARK: - English (US)

extension Strings {
    static let enUS = Strings(
        statusIdleTooltip: "Kryon: normal sleep",
        statusActiveUntil: "Kryon: awake until",
        statusActiveIndefinite: "Kryon: awake indefinitely",
        menuEnableAwake: "Enable keep awake",
        menuDisableAwake: "Disable keep awake",
        menuActivateFor: "Activate for…",
        menuSettings: "Settings…",
        menuAbout: "About Kryon",
        menuQuit: "Quit Kryon",
        menuHide: "Hide Kryon",
        menuHideOthers: "Hide Others",
        menuShowAll: "Show All",
        menuEdit: "Edit",
        menuUndo: "Undo",
        menuRedo: "Redo",
        menuCut: "Cut",
        menuCopy: "Copy",
        menuPaste: "Paste",
        menuSelectAll: "Select All",
        menuWindow: "Window",
        menuMinimize: "Minimize",
        menuZoom: "Zoom",
        menuClose: "Close",

        minutes15: "15 minutes",
        minutes30: "30 minutes",
        hour1: "1 hour",
        hours2: "2 hours",
        hours4: "4 hours",
        hours8: "8 hours",
        indefinitely: "Indefinitely",
        indefinite: "Indefinite",

        panelSettings: "Settings",
        panelQuit: "Quit",
        panelHotkeyHint: "Shortcut toggles",

        keepAwakeTitle: "Keep awake",
        keepAwakeEndsIn: "Ends in",
        keepAwakeUntilDisabled: "Active until you turn it off",
        keepAwakeNormalRules: "The Mac follows its normal energy rules",
        keepAwakeOptions: "Options",
        keepAwakeMouseJiggle: "Move pointer slightly",
        keepAwakeMouseJiggleCaption: "During a session, moves the pointer a little at the chosen interval.",
        keepAwakeMouseJiggleInterval: "Interval",
        keepAwakeActiveIconLabel: "Active icon",
        keepAwakeActiveIconKryon: "Kryon",
        keepAwakeActiveIconCoffee: "Coffee",
        keepAwakeActiveIconEye: "Eye",
        keepAwakeActiveIconMoon: "Moon",
        keepAwakeActiveIconLight: "Lightbulb",
        keepAwakeIconTintLabel: "Active icon color",
        keepAwakeIconTintOrange: "Orange",
        keepAwakeIconTintGreen: "Green",
        keepAwakeIconTintBlue: "Blue",
        keepAwakeIconTintPurple: "Purple",
        keepAwakeIconTintPink: "Pink",
        keepAwakeIconTintNone: "No color",
        durationLabel: "Duration",
        clamshellTitle: "Keep going with the lid closed",
        clamshellOnCaption: "Sleep fully disabled. Mind the power",
        clamshellNeedsSession: "Applied whenever “Keep awake” is active",
        clamshellReady: "Ready. Toggles without a password",
        clamshellNeedsPassword: "Will ask for the administrator password once",

        systemSection: "System",
        temperatures: "Temperatures",
        cpuLabel: "CPU",
        gpuLabel: "GPU",
        batteryLabel: "Battery",
        usageSection: "Hardware usage",
        memorySection: "Memory",
        memoryPressure: "Pressure",
        memorySwapUsed: "Swap used",
        memoryCompressed: "Compressed",
        memoryCachedFiles: "Cached files",
        pressureNormal: "Normal",
        pressureWarning: "Caution",
        pressureCritical: "Critical",
        monitorUnavailable: "Sensors unavailable on this Mac",
        energyAppsTitle: "Apps using significant energy",
        energyAppsIdle: "No significant energy use",

        notifySessionEndedTitle: "Session ended",
        notifySessionEndedBody: "Time is up. The Mac will sleep normally again.",
        notifyBatteryTitle: "Kryon disabled",
        notifyBatteryBody: "Low battery. Normal sleep was restored to protect the charge.",
        adminPromptClamshellOn: "Kryon needs your password to keep the Mac going with the lid closed.",
        adminPromptClamshellOff: "Kryon needs your password to restore the Mac's normal sleep.",
        adminPromptRecover: "Kryon quit while the Mac's sleep was disabled. Enter the password to restore normal sleep.",
        adminPromptUpdate: "Kryon needs your password to install the update.",
        adminPromptSudoersInstall: "Kryon will create a restricted rule (pmset disablesleep only) to toggle closed-lid mode without asking for a password. This is the only time the password is needed.",
        adminPromptSudoersRemove: "Kryon will remove the password-free closed-lid rule.",

        settingsTitle: "Kryon Settings",
        tabGeneral: "General",
        tabEnergy: "Energy",
        tabMouse: "Mouse & Trackpad",
        tabSwitcher: "Switcher",
        tabAdvanced: "Advanced",
        tabAbout: "About",
        tabReleaseNotes: "What's New",
        releaseNotesOnUpdateToggle: "Show what's new after updating",
        whatsNewDontShowAgain: "Don't show again",
        previewSizeLabel: "Preview size",
        previewSizeNormal: "Normal",
        previewSizeLarge: "Large",
        previewSizeXLarge: "Extra large",
        settingsGroupFeatures: "Features",
        advancedResetSection: "Permissions",
        advancedResetDescription: "Removes every permission you granted Kryon (Accessibility, Screen Recording, Full Disk Access and others), the login item and the closed-lid rule. Useful to start fresh or before uninstalling. The app stays installed.",
        advancedClearButton: "Clear all permissions",
        advancedCleared: "Permissions cleared.",
        advancedClearConfirmTitle: "Clear all permissions?",
        advancedClearConfirmBody: "Features that need permissions will stop working until you grant them again. Your settings are kept.",
        advancedUninstallSection: "Uninstall",
        advancedUninstallDescription: "Does all of the above, then removes the preferences and moves Kryon to the Trash, leaving nothing behind. The app quits when done. You can reinstall anytime.",
        advancedUninstallButton: "Uninstall Kryon completely",
        advancedUninstallConfirmTitle: "Uninstall Kryon?",
        advancedUninstallConfirmBody: "Kryon will clear its permissions, remove its preferences and move to the Trash, then quit. This can't be undone from the app, but it stays in the Trash until you empty it.",

        launchAtLogin: "Launch at login",
        languageLabel: "Language",
        menuBarSection: "Menu bar",
        showCountdown: "Show remaining time next to the icon",
        globalHotkeySection: "Global shortcut",
        hotkeyToggle: "Enable shortcut for “Keep awake”",
        hotkeyCaption: "Works in any app, no extra permissions.",

        sessionSection: "Session",
        defaultDurationLabel: "Default duration",
        keepAwakeAutoStart: "Keep Awake when Kryon opens",
        keepAwakeAutoStartCaption: "Starts a session with the default duration.",
        batteryProtectionSection: "Battery protection",
        batteryDisableBelow: "Disable when battery drops below",
        batteryNever: "Never",
        batteryProtectionCaption: "Keeps a forgotten session from draining the MacBook battery.",
        clamshellSection: "Closed lid",
        configuring: "Configuring…",
        sudoersFailed: "Couldn't turn on closed-lid mode. Try again.",
        clamshellExplanation: "“Keep going with the lid closed” fully disables sleep while “Keep awake” is active and is reverted automatically when the session ends or the app quits. Prefer using it plugged in.",

        scrollSection: "Scrolling",
        invertMouseScroll: "Invert mouse scrolling",
        invertMouseScrollCaption: "Reverses the mouse wheel direction.",
        scrollTrackpadNote: "The trackpad is untouched: it keeps macOS natural scrolling.",
        scrollActiveNow: "Inverting mouse scrolling right now",
        mouseNavigationActiveNow: "Side buttons active right now",
        smoothScrollName: "Smooth scrolling",
        smoothScrollCaption: "Turns each mouse wheel step into a short, gentle glide. The trackpad is not affected.",
        smoothScrollStepLabel: "Distance per step",
        mouseNavigationSection: "Navigation",
        mouseNavigationEnable: "Use side buttons for Back and Forward",
        mouseNavigationCaption: "Turns the mouse Back and Forward buttons into navigation commands in Finder, browsers and compatible apps.",
        middleClickSection: "Middle click",
        middleClickEnable: "Three-finger click acts as middle click",
        middleClickEnableCaption: "Pressing the trackpad with three fingers works like a mouse wheel click: open links in a new tab, close tabs and everything else the middle button does.",
        middleClickDragConflict: "macOS three-finger drag is turned on and uses this same gesture. Turn it off in System Settings under Accessibility, Pointer Control, Trackpad Options, and the middle click will work.",
        middleClickTapPicker: "A light tap also clicks",
        middleClickTapOff: "Off",
        middleClickTapThreeFingers: "3 fingers",
        middleClickTapFourFingers: "4 fingers",
        middleClickTapCaption: "A light tap with that many fingers, without pressing, also fires the middle click. Sliding never counts. If the macOS three-finger tap is assigned to Look Up, turn it off so both do not fire together.",
        quickToolsTab: "Quick panel",
        quickToolShortcutToggle: "Global shortcut",
        ocrName: "Copy text from screen",
        ocrCaption: "Select an area of the screen and the recognized text is copied, ready to paste.",
        ocrCopied: "Text copied",
        ocrNoText: "No text found",
        colorPickerName: "Color picker",
        colorPickerCaption: "Grab the color of any pixel on screen and copy it in your favorite format.",
        colorPickerFormatLabel: "Copied format",
        colorPickerBareHexToggle: "Copy without the # prefix",
        colorPickerPickNow: "Pick color",
        micMuteName: "Mute microphone",
        micUnmuteName: "Unmute microphone",
        micMuteCaption: "Cuts the Mac's microphone with a click or shortcut, across every app.",
        micMutedHUD: "Microphone muted",
        micUnmutedHUD: "Microphone back on",
        micMuteMenuBarToggle: "Show in the menu bar while muted",
        micMuteMenuBarCaption: "A red crossed-out mic appears beside the app's icon in the menu bar.",
        pastePlainName: "Paste as plain text",
        pastePlainCaption: "Pastes what you copied without colors, fonts or formatting. The original stays on the clipboard.",
        launcherName: "Quick panel",
        launcherCaption: "A floating panel with your favorite tools, summoned by a shortcut from anywhere.",
        launcherOpenNow: "Open quick panel",
        launcherEditHint: "Use the tune button to choose, hide and drag the tools around.",
        launcherEmptyState: "All tools are hidden. Use the tune button to add them back.",
        launcherAddSection: "Add back",
        launcherKeysHint: "Arrows navigate, Enter opens, 1 to 9 open directly",

        switcherSection: "App switcher",
        switcherEnable: "Use the Kryon switcher",
        switcherEnableCaption: "Switch between apps and windows, including minimized windows and multiple windows from the same app.",
        switcherUsageHint: "Hold the shortcut to navigate; release to activate the window. Shift or ← goes back; W closes the window; Q quits the app; Esc cancels.",
        switcherNoWindows: "No open windows",
        switcherIconRowMode: "Show %@ with large icons",
        switcherIconRowModeCaption: "Shows one icon per app with that app's window previews above it.",
        switcherSimpleMode: "Simple app switcher",
        switcherSimpleModeCaption: "Shows app icons and window titles, without previews or screen capture by the switcher.",
        switcherShortcutHintApps: "Apps",
        switcherShortcutHintWindows: "Windows",
        switcherWindowShortcutCaption: "Opens a switcher for the frontmost app's windows. While the Apps switcher is open, jumps between the selected app's windows.",
        switcherMergeTabs: "Show one entry per app",
        switcherMergeTabsCaption: "Collapses all of an app's windows into one entry in the switcher, instead of one entry per window.",
        switcherWindowlessApps: "Apps with no open window",
        switcherWindowlessAppsCaption: "Chooses which running apps with no window at all show up in the switcher.",
        switcherWindowlessAppsOff: "Do not show",
        switcherWindowlessAppsFinder: "Finder only",
        switcherWindowlessAppsAll: "All apps",
        switcherNoOpenWindow: "No open window",
        switcherOtherDesktop: "Other desktop",
        dockPreviewName: "Dock Preview",
        dockPreviewEnable: "Preview windows from the Dock",
        dockPreviewEnableCaption: "Hover over an open app in the Dock to see its windows, then click the one you want.",
        dockPreviewBackgroundOpacity: "Panel background",
        dockPreviewBackgroundOpacityCaption: "Turn it down to see more of what sits behind the panel.",
        dockPreviewOpenDelay: "Open delay",
        dockPreviewOpenDelayCaption: "How long the pointer has to rest on an icon before its panel opens.",
        dockClickMinimize: "Click the Dock icon to minimize",
        dockClickMinimizeCaption: "The active app's windows minimize when you click its Dock icon. Click again to bring them back.",
        dockClickCycleWindows: "Click the Dock icon to cycle windows",
        dockClickCycleWindowsCaption: "Click an active app's Dock icon to rotate through its windows, like ⌘`.",
        dockPreviewActiveNow: "Active in the Dock",
        dockPreviewDockUnavailable: "Could not read Dock items.",
        dockPreviewAutohideBeta: "Beta. You may run into some bugs.",
        dockPreviewOpenWindow: "Open window",
        dockPreviewCloseWindow: "Close window",
        dockPreviewMinimizeWindow: "Minimize window",
        dockPreviewRestoreWindow: "Restore window",
        dockPreviewPinPanel: "Pin preview",
        dockPreviewUnpinPanel: "Unpin preview",
        dockPreviewPinned: "Pinned",
        dockPreviewClosePanel: "Close preview",
        dockPreviewPreviousWindow: "Previous window",
        dockPreviewNextWindow: "Next window",

        cutPasteName: "Cut & paste",
        cutPasteEnable: "Cut & paste files in Finder",
        cutPasteEnableCaption: "Use ⌘X to cut and ⌘V to move files and folders in Finder.",
        cutPasteHowTitle: "How to use",
        cutPasteStep1: "Select items in Finder and press ⌘X to cut them.",
        cutPasteStep2: "Open the destination folder and press ⌘V to move them there.",
        cutPasteTextNote: "In text fields (like when renaming), ⌘X and ⌘V keep working as usual.",
        cutPasteActiveNow: "Ready to cut in Finder",
        cutPasteAutomationNote: "The first time, macOS asks for permission to control Finder.",
        cutReadyTitle: "Cut",
        cutReadyHint: "in the destination folder to move",
        cutCancel: "Cancel cut",
        cutDoneTitle: "Moved!",
        cutMovedSingular: "1 item moved",
        cutMovedPluralFormat: "%d items moved",
        cutSomeFailed: "Some items couldn’t be moved",
        cutMovingTitle: "Moving…",
        cutMovingCountFormat: "%d of %d",

        autoQuitName: "Quit on close",
        autoQuitEnable: "Quit an app when its last window closes",
        autoQuitEnableCaption: "Closing an app's last window also quits it.",
        autoQuitActiveNow: "Active now",
        autoQuitHowTitle: "How it works",
        autoQuitStep1: "Close an app's last window (⌘W or the red button).",
        autoQuitStep2: "The app quits on its own. “Save changes?” dialogs still appear.",
        autoQuitPredictableNote: "Apps that normally run without a window are never quit.",
        autoQuitExceptionsTitle: "Exceptions",
        autoQuitExceptionsCaption: "Apps on this list stay open even with no windows.",
        autoQuitExceptionsEmpty: "No exceptions",
        autoQuitAddApp: "Add app…",

        uninstallerName: "Uninstaller",
        uninstallerEnableCaption: "Removes an app together with the caches, preferences, logs and leftovers it leaves behind.",
        uninstallerStep1: "Drag an app onto Settings, or pick one from the list.",
        uninstallerStep2: "Review the files found and how much space they take.",
        uninstallerStep3: "Move what you want to the Trash. Nothing is deleted permanently.",
        uninstallerMenuItem: "Uninstall an app…",
        uninstallerDropTitle: "Drag an app here",
        uninstallerDropSubtitle: "or choose one to scan",
        uninstallerChoose: "Choose app…",
        uninstallerPickerTitle: "Choose app",
        uninstallerPickerSearch: "Search apps",
        uninstallerPickerEmpty: "No apps found",
        uninstallerEmptyNote: "Nothing is removed without your confirmation.",
        uninstallerFDANote: "Grant Full Disk Access for a more thorough scan.",
        uninstallerFDAGrant: "Grant access…",
        uninstallerFDAHint: "Turn Kryon on in the list. If it isn't there, click + and pick Kryon from Applications. Access only applies after you reopen the app.",
        uninstallerFDARelaunch: "Relaunch now",
        uninstallerScanning: "Scanning files…",
        uninstallerRemoving: "Moving to the Trash…",
        uninstallerFoundTitle: "found",
        uninstallerSelectedFormat: "%d of %d selected",
        uninstallerRemove: "Move to Trash",
        uninstallerCancel: "Cancel",
        uninstallerDoneTitle: "Done!",
        uninstallerFreedFormat: "%@ recovered",
        uninstallerSomeFailed: "Some items couldn't be moved to the Trash.",
        uninstallerAnother: "Uninstall another",
        uninstallerCatApp: "Application",
        uninstallerCatSupport: "Support",
        uninstallerCatCaches: "Caches",
        uninstallerCatPreferences: "Preferences",
        uninstallerCatContainers: "Containers",
        uninstallerCatLogs: "Logs",
        uninstallerCatState: "Saved state",
        uninstallerCatOther: "Other",

        urlCleanerName: "Clean URL",
        urlCleanerEnable: "Clean copied URLs",
        urlCleanerEnableCaption: "Removes tracking parameters from copied links.",
        urlCleanerActiveNow: "Active now",
        urlCleanerManualTitle: "Clean now",
        urlCleanerInputPlaceholder: "Paste a URL",
        urlCleanerOutputPlaceholder: "The clean URL appears here",
        urlCleanerCleanButton: "Clean",
        urlCleanerPasteButton: "Paste",
        urlCleanerCopyButton: "Copy",
        urlCleanerClearButton: "Clear field",
        urlCleanerNoURL: "Paste a valid URL.",
        urlCleanerNoChange: "Nothing to clean.",
        urlCleanerCleaned: "URL cleaned.",
        urlCleanerCopied: "Copied.",
        urlCleanerLocalNote: "Local. No network.",

        homebrewName: "Homebrew",
        homebrewEnableCaption: "Search, install and remove formulae and casks.",
        homebrewMissingTitle: "Homebrew not found",
        homebrewMissingBody: "Kryon can open Terminal with the official Homebrew installer. Terminal shows the steps and asks for your password if needed.",
        homebrewInstallHomebrew: "Install Homebrew",
        homebrewInstallHomebrewCaption: "When Terminal finishes, come back here and click Refresh.",
        homebrewInstallHomebrewOpened: "Installer opened in Terminal.",
        homebrewShellSetupTitle: "Finish Terminal setup",
        homebrewShellSetupBody: "Homebrew is installed, but Terminal may not find the brew command yet. Kryon can open Terminal with the setup command.",
        homebrewShellSetupButton: "Set up Terminal",
        homebrewShellSetupOpened: "Command opened in Terminal. Then come back here and click Refresh.",
        homebrewRefresh: "Refresh",
        homebrewCheckPackages: "Check packages",
        homebrewTrustTitle: "Tap not trusted yet",
        homebrewTrustCaption: "Homebrew now asks for your confirmation before using third party taps. Trust %@ to continue.",
        homebrewTrustButton: "Trust and continue",
        homebrewSearchPlaceholder: "Search packages",
        homebrewKeyboardHint: "Space or Return closes the macOS panel. Use the search button.",
        homebrewSearchButton: "Search",
        homebrewSearchResults: "Results",
        homebrewInstalled: "Installed",
        homebrewAll: "All",
        homebrewFormulas: "Formulae",
        homebrewCasks: "Casks",
        homebrewNoPackages: "No packages found",
        homebrewNoSelection: "Select an installed package or search for a new one.",
        homebrewDetailsTitle: "Package details",
        homebrewInstall: "Install",
        homebrewUninstall: "Uninstall",
        homebrewUpgrade: "Update",
        homebrewUpgradeAll: "Update all",
        homebrewUpdateHomebrew: "Update Homebrew",
        homebrewAllPackages: "packages",
        homebrewOpenTerminal: "Open Terminal",
        homebrewCancelOperation: "Cancel",
        homebrewClearLog: "Clear log",
        homebrewLogTitle: "Log",
        homebrewVersion: "Version",
        homebrewDescription: "Type",
        homebrewHomepage: "Open website",
        homebrewPopularity: "Popularity",
        homebrewPopularityFormat: "%@ installs in %@ days",
        homebrewInstalledBadge: "Installed",
        homebrewNotInstalledBadge: "Not installed",
        homebrewUpdates: "Updates",
        homebrewUpdateAvailableBadge: "Update available",
        homebrewLatestVersion: "Latest",
        homebrewConfirmInstallTitle: "Install with Homebrew?",
        homebrewConfirmInstallBodyFormat: "Homebrew will download and install %@. Dependencies may also be installed.",
        homebrewConfirmUninstallTitle: "Uninstall with Homebrew?",
        homebrewConfirmUninstallBodyFormat: "Homebrew will uninstall %@. Configuration files may remain on the system.",
        homebrewConfirmUpgradeTitle: "Update with Homebrew?",
        homebrewConfirmUpgradeBodyFormat: "Homebrew will download and apply the latest version of %@. Dependencies may also be updated.",
        homebrewConfirmUpgradeAllTitle: "Update all with Homebrew?",
        homebrewConfirmUpgradeAllBody: "Homebrew will download and apply the latest versions for packages with updates available. Dependencies may also be updated.",
        homebrewConfirmUpdateHomebrewTitle: "Update Homebrew?",
        homebrewConfirmUpdateHomebrewBody: "Homebrew will fetch the latest information and then reload your packages.",
        homebrewTerminalFallback: "This operation needs Terminal to ask for the administrator password. Kryon does not capture passwords.",
        homebrewLoading: "Loading…",
        homebrewSearchEmpty: "No results",
        homebrewOperationInstallFormat: "Installing %@",
        homebrewOperationUninstallFormat: "Uninstalling %@",
        homebrewOperationUpgradeFormat: "Updating %@",
        homebrewOperationUpgradeAll: "Updating packages",
        homebrewOperationUpdateHomebrew: "Updating Homebrew",
        homebrewOperationInstalledFormat: "%@ installed.",
        homebrewOperationUninstalledFormat: "%@ uninstalled.",
        homebrewOperationUpgradedFormat: "%@ updated.",
        homebrewOperationUpgradedAll: "Packages updated.",
        homebrewOperationUpdatedHomebrew: "Homebrew updated.",
        homebrewOperationFailedFormat: "Could not finish %@.",
        homebrewOperationCancelled: "Operation cancelled.",
        homebrewOperationPreparing: "Preparing...",
        homebrewOperationDownloading: "Downloading files...",
        homebrewOperationInstalling: "Installing files...",
        homebrewOperationUninstalling: "Removing files...",
        homebrewOperationUpgrading: "Updating files...",
        homebrewOperationFinalizing: "Finishing...",
        homebrewOperationRefreshing: "Refreshing list...",
        homebrewOperationTerminal: "Continue in Terminal.",
        homebrewOperationElapsedFormat: "%@ elapsed",
        homebrewOperationShowDetails: "Show details",
        homebrewOperationHideDetails: "Hide details",
        homebrewOperationTechnicalLog: "Technical details",
        homebrewOperationProgressUnknown: "Homebrew has not reported a percentage yet.",

        mediaName: "Media",
        mediaEnableCaption: "Compress videos, convert and process images, make GIFs and extract text locally.",
        mediaLocalNote: "Local. No network.",
        mediaToolVideo: "Video",
        mediaToolGIF: "GIF",
        mediaToolImage: "Image",
        mediaToolText: "Text",
        mediaSelectFile: "Choose file",
        mediaDropHint: "Drop a file here or click to choose one.",
        mediaOutput: "Output",
        mediaOutputAutomatic: "Automatic",
        mediaChooseOutput: "Destination",
        mediaStartVideo: "Compress video",
        mediaStartGIF: "Make GIF",
        mediaStartImage: "Process image",
        mediaStartConvertPDF: "Convert to PDF",
        mediaStartText: "Extract text",
        mediaCancel: "Cancel",
        mediaStartTime: "Start",
        mediaEndTime: "End",
        mediaQuality: "Compression",
        mediaCompressionLow: "Low",
        mediaCompressionMedium: "Medium",
        mediaCompressionHigh: "High",
        mediaMaxSize: "Size",
        mediaWidth: "Width",
        mediaFPS: "FPS",
        mediaKeepAudio: "Keep audio",
        mediaCodec: "Codec",
        mediaFormat: "Format",
        mediaStripMetadata: "Remove metadata",
        mediaLoopGIF: "Loop GIF",
        mediaOCRMode: "OCR",
        mediaOCRAccurate: "Accurate",
        mediaOCRFast: "Fast",
        mediaLanguageCorrection: "Language correction",
        mediaTextOutputNote: "Extracted text can be copied and saved as TXT.",
        mediaRunning: "Processing",
        mediaCompleted: "Done",
        mediaCancelled: "Cancelled.",
        mediaOpenInFinder: "Show",
        mediaCopyText: "Copy text",
        mediaRunAgain: "Run again",
        mediaEmptyText: "No text found.",
        mediaResultSavedFormat: "Saved as %@",
        mediaResultSizeFormat: "%@ to %@",
        mediaResultGrewCaption: "The converted file came out larger than the original.",
        mediaErrorNoFile: "Choose a file first.",
        mediaErrorNoVideo: "This file has no video track.",
        mediaErrorSameOutput: "Choose a destination different from the original file.",
        mediaErrorUnsupported: "Format not supported by macOS.",

        shelfName: "Shelf",
        shelfEnable: "Temporary area for dragging files",
        shelfEnableCaption: "A floating spot to gather files, images and text, then drag them anywhere later.",
        shelfHowTitle: "How to use",
        shelfStep1: "Open it with the shortcut, or by shaking the mouse during a drag.",
        shelfStep2: "Drop files, images, links or text onto it to hold them.",
        shelfStep3: "Drag each item back out to any app when you need it.",
        shelfShakeToggle: "Open by shaking the mouse while dragging",
        shelfShakeCaption: "Shake the pointer quickly while holding an item to summon it near the cursor.",
        shelfDropZoneToggle: "Keep dragged files in the menu bar",
        shelfDropZoneCaption: "While you drag a file, the shelf appears below the menu bar icon. Whatever you drop is kept right there, in a button you shrink and open with a click that goes away once the shelf is empty.",
        shelfDropZoneLabel: "Drop here",
        shelfCollapse: "Collapse",
        shelfBehaviorTitle: "After use",
        shelfCloseAfterDrop: "Close after dropping into another app",
        shelfCloseAfterDropCaption: "Closes the shelf when the destination accepts the items. The pin in the panel keeps it open.",
        shelfRemoveAfterDrop: "Remove items after dropping",
        shelfRemoveAfterDropCaption: "Items accepted by another app leave the shelf. Turn this off to keep a copy there.",
        shelfExclusionsTitle: "Automatic exceptions",
        shelfExclusionsEmpty: "No apps added.",
        shelfExclusionsCaption: "Shake and the menu bar drop zone stay off for drags started in these apps. The shortcut and Open now still work.",
        shelfPin: "Keep open",
        shelfUnpin: "Allow closing after use",
        extraBrightnessName: "Extra brightness",
        extraBrightnessCaption: "Uses the display's HDR headroom to go past the maximum brightness. Uses more battery and the Mac can run warm.",
        extraBrightnessLevelLabel: "Intensity",
        extraBrightnessUnsupported: "Available only on XDR displays, such as the ones on the 14 and 16 inch MacBook Pro.",
        shelfHotkeyLabel: "Shortcut",
        shelfOpenNow: "Open now",
        shelfNoPermission: "Requires no permissions.",
        shelfMenuItem: "Open shelf",
        shelfTitle: "Shelf",
        shelfEmpty: "Drag items here",
        shelfClearAll: "Clear all",
        shelfRemoveSelected: "Remove selected",
        shelfSelectedFormat: "%d selected",
        shelfHint: "Click to select. Drag out to use or right-click for more actions.",
        shelfItemImage: "Image",
        shelfTooltipItemsFormat: "%d items",
        shelfTooltipImageSingular: "%d image",
        shelfTooltipImagePlural: "%d images",
        shelfTooltipFileSingular: "%d file",
        shelfTooltipFilePlural: "%d files",
        shelfTooltipNoteSingular: "%d note",
        shelfTooltipNotePlural: "%d notes",
        shelfTooltipLinkSingular: "%d link",
        shelfTooltipLinkPlural: "%d links",
        shelfActionOpen: "Open",
        shelfActionOpenWith: "Open With",
        shelfActionAirDrop: "Share with AirDrop",

        breakdownMeasuring: "Measuring…",

        mixerSection: "Volume mixer",
        mixerEmpty: "Apps that use audio show up here",
        mixerUnavailable: "Available on macOS 14.4 and later",
        mixerPermissionBody: "To adjust per-app volume, allow “Screen & System Audio Recording” in System Settings. Audio is never recorded.",
        mixerResetTooltip: "Reset to 100%",
        mixerOutputDefault: "Default",
        mixerOutputCurrent: "current",
        mixerOutputUnavailable: "Output unavailable",
        mixerOutputFallback: "Using default until this device returns.",
        mixerBypassedCaption: "This app manages its own audio.",
        mixerOutputTooltip: "Choose output",
        mixerSystemOutputTitle: "Output",
        mixerSystemOutputNoDevices: "No outputs found",
        mixerSystemOutputTooltip: "Choose system output",
        mixerSystemOutputErrorFormat: "Could not switch: %@",
        mixerLowerOnHeadphonesDisconnect: "Lower volume when headphones disconnect",
        mixerLowerOnHeadphonesDisconnectCaption: "Adjusts output when wired or Bluetooth headphones disconnect.",
        mixerHeadphonesDisconnectVolume: "Volume after disconnect",
        soundOutputSwitcherTitle: "Output switcher",
        soundOutputSwitcherEnable: "Switch outputs with shortcut",
        soundOutputSwitcherCaption: "Choose outputs and use the shortcut to move to the next available one.",
        soundOutputSwitcherDevices: "Outputs in cycle",
        soundOutputSwitcherNoAvailableSelection: "Select at least one available output.",
        mixerInputTitle: "Microphone",
        mixerInputNoDevices: "No microphones found",
        mixerInputUnavailable: "Microphone unavailable",
        mixerInputFallback: "Using default until this microphone returns.",
        mixerInputTooltip: "Choose microphone",
        mixerInputErrorFormat: "Could not switch: %@",
        mixerVisibleApps: "Apps in the list",
        mixerAllShown: "All",
        mixerHiddenCountLabel: "Hidden",
        mixerHideFromList: "Hide from the list",

        updatesSection: "Updates",
        autoCheckToggle: "Check for updates automatically",
        includeBetaUpdatesToggle: "Receive beta updates",
        includeBetaUpdatesCaption: "Beta versions include features in development and may contain bugs or incomplete behavior.",
        betaBadgeLabel: "Beta",
        checkNowButton: "Check now",
        updateChecking: "Checking…",
        updateUpToDate: "You're on the latest version.",
        updateAvailablePrefix: "Update available:",
        updateInstallButton: "Download and install",
        updateDownloading: "Downloading update…",
        updateInstalling: "Installing and restarting…",
        updateFailedPrefix: "Couldn't check:",
        updateLastChecked: "Last checked:",
        updateNotifyTitle: "Kryon update",
        updateInstallFailedBody: "The update was downloaded but could not be applied. Download the latest version from the GitHub releases page and drag the app over the current one.",
        updateNeedsApplicationsTitle: "Move Kryon to Applications",
        updateNeedsApplicationsBody: "The app is running from a place that cannot be updated, such as the disk image or a temporary system location. Drag Kryon to the Applications folder, open it from there and try again.",
        menuCheckUpdates: "Check for updates…",

        permissionRequired: "Permission required",
        permissionAccessibility: "Accessibility",
        permissionScreenRecording: "Screen Recording",
        permissionGranted: "Granted",
        permissionMissing: "Not granted",
        permissionOpenSettings: "Open System Settings…",
        permissionRequest: "Grant access",
        permissionRestartNote: "macOS may ask to reopen the app after granting.",

        aboutDescription: "A utility hub for your Mac.\nEnergy, system monitor, scrolling and a window switcher, right in the menu bar.",
        versionPrefix: "Version",
        reviewIntro: "Review introduction",
        reviewHighlights: "Review highlights",
        viewOnGitHub: "View on GitHub",

        obContinue: "Continue",
        obBack: "Back",
        obSkipStep: "Skip this step",
        obStart: "Open Kryon",
        obStepWelcomeTitle: "Welcome to Kryon",
        obStepWelcomeBody: "A discreet menu bar utility that makes everyday macOS more practical.",
        obWelcomeBullet1Title: "Energy under control",
        obWelcomeBullet1Body: "Keep the Mac awake for as long as you want, even with the lid closed.",
        obWelcomeBullet2Title: "A clear view of the system",
        obWelcomeBullet2Body: "CPU, GPU and battery temperatures, hardware usage and memory pressure in real time.",
        obWelcomeBullet3Title: "Mouse and windows, your way",
        obWelcomeBullet3Body: "Reversed mouse scrolling and a window switcher with thumbnails.",
        obLanguageLabel: "Language",
        obStepAccessibilityTitle: "Accessibility",
        obStepAccessibilityBody: "Needed to invert mouse scrolling and for the window switcher to respond to the keyboard.",
        obAccessibilityWhy: "The app only watches the mouse wheel and the switcher shortcut. Nothing is recorded or sent anywhere.",
        obStepRecordingTitle: "Screen Recording",
        obStepRecordingBody: "Lets the switcher show real window thumbnails instead of icons only.",
        obRecordingWhy: "Thumbnails are generated on the fly, stay in memory and never leave your Mac. Without it, the switcher still works with icons.",
        obStepMonitorTitle: "System monitor",
        obStepMonitorBody: "The panel shows CPU, GPU and battery temperatures, hardware usage and memory pressure.",
        obMonitorNoPermission: "No permission needed. Sensors are read straight from the system.",
        obStepOptionalTitle: "Optional features",
        obStepOptionalBody: "Turn on what you want to use now. Everything can be changed later in Settings.",
        obStepStatusTitle: "Checkup",
        obStepStatusBody: "Make sure everything is ready for the features you want.",
        obStatusRecheck: "Check again",
        obStepDoneTitle: "All set!",
        obStepDoneBody: "Kryon is already looking after your Mac.",
        obDoneHint: "Look for the black hole in the menu bar, at the top right of the screen.",
        obWhatsNewTitle: "What's new in this version",
        obWhatsNewFallback: "This update includes the latest fixes and improvements.",
        obLanguageUpdateTitle: "Now in your language",
        obLanguageUpdateBody: "Kryon now speaks several languages. Choose the one you’d like to use; you can change it anytime in Settings.",
        obPurposeTitle: "What brought you here?",
        obPurposeBody: "Choose a ready setup or select exactly what you want to use.",
        obPurposeSkip: "You can add or remove features later in Settings.",

        tabMonitor: "Monitor",
        monitorMenuBarSection: "In the menu bar",
        monitorMenuBarCaption: "Choose what appears next to the icon in the menu bar.",
        monitorCombineTemperatures: "Combine usage and temperature",
        monitorCombineTemperaturesCaption: "When usage and temperature for the same item are enabled, show them in one block.",
        monitorSeparateMenuBarMetrics: "Separate metrics into their own items",
        monitorSeparateMenuBarMetricsCaption: "Separates active blocks in the menu bar and keeps usage and temperature together when combine is on.",
        monitorNetworkUploadFirst: "Upload above download",
        monitorShowCPU: "CPU",
        monitorShowMemory: "Memory",
        monitorShowNetwork: "Network",
        monitorShowPowerLabel: "Power",
        monitorIntervalLabel: "Update every",
        monitorInterval1: "1 second",
        monitorInterval2: "2 seconds",
        monitorInterval5: "5 seconds",
        monitorPanelSection: "In the panel",
        panelNavigationMode: "Navigate panel by sections",
        panelNavigationCaption: "Shows one section at a time. Choose List to see everything in one continuous scroll.",
        panelFooterSections: "Sections",
        panelFooterList: "List",
        betaBadge: "BETA",
        betaFeatureWarning: "Beta. You may run into some bugs.",

        networkSection: "Network",
        networkDownload: "Download",
        networkUpload: "Upload",
        networkThisSession: "This session",
        networkMeasuring: "Measuring…",
        networkApps: "Apps using network",
        networkAppsIdle: "No apps using network now",

        diskSection: "Disks",
        diskUsed: "used",
        diskFree: "free",
        diskInternal: "Internal",
        diskExternal: "External",
        diskSelect: "Select disk",
        diskRead: "Read",
        diskWrite: "Write",
        diskSMARTStatus: "Status",
        diskSMARTUnavailable: "SMART unavailable for this disk",
        diskTotalRead: "Total read",
        diskTotalWritten: "Total written",
        diskTemperature: "Temperature",
        diskHealth: "Health",
        diskPowerCycles: "Power cycles",
        diskPowerOnHours: "Power on hours",
        diskUnsafeShutdowns: "Unsafe shutdowns",
        diskMediaErrors: "Media errors",
        diskEject: "Eject",
        diskEjectAll: "Eject all",
        diskEjecting: "Ejecting…",
        diskReadyToRemove: "Ready to remove",
        diskEjectFailed: "Could not eject",
        diskProtectionCaption: "Eject before unplugging.",
        diskNoExternal: "No external disk ready to eject.",
        diskOpenInFinder: "Open",
        diskStorageSettings: "Storage",
        diskNoDisks: "No mounted disks found.",

        powerSection: "Power",
        powerSystem: "System",
        powerAdapter: "Adapter",
        powerBattery: "Battery",
        powerCharging: "Charging",
        powerOnBattery: "On battery",
        powerPluggedIn: "Plugged in",
        powerUnavailable: "Power metrics unavailable on this Mac",
        powerAdapterMaxFormat: "%@ max",
        monitorShowGPU: "GPU",
        monitorShowCPUTemperature: "CPU temperature",
        monitorShowGPUTemperature: "GPU temperature",
        monitorShowBatteryTemperature: "Battery temperature",
        monitorShowPeripheralBattery: "Peripheral battery",
        peripheralBatteryNoDevices: "No devices found",
        monitorGraphsSection: "Graphs",
        monitorGraphsCaption: "Choose which metrics show a graph over time.",

        updateBannerTitle: "Update available",
        updateBannerAction: "Update",
        obStepMenuBarTitle: "Metrics in the menu bar",
        obStepMenuBarBody: "Pick what to show next to the icon. The preview above updates live.",
        obStepMenuBarNote: "New: Network and Power blocks and graphs in the panel. Fine-tune it all later in Settings › Monitor.",
        monitorMenuBarPresetLabel: "Style",
        menuBarPresetReadable: "Readable",
        menuBarPresetDense: "Dense",
        menuBarSpacingLabel: "Menu bar spacing",
        menuBarSpacingStandard: "Standard",
        menuBarSpacingCompact: "Compact",
        menuBarHideIconToggle: "Hide the app icon while metrics are shown",
        menuBarHideIconCaption: "The icon returns by itself when metrics leave the bar and when there is something to signal (an update ready or the microphone muted).",
        monitorLabelStyleLabel: "Labels",
        menuBarLabelStyleCompact: "Compact",
        menuBarLabelStyleClassic: "Classic",
        monitorMemoryStyleLabel: "Show memory as",
        monitorMemoryPressureDot: "Pressure dot",
        memoryStyleDot: "Dot",
        memoryStylePercent: "%",
        memoryStyleBoth: "Both",
        systemUptime: "Up for",
        batteryCharge: "Charge",
        powerHealth: "Battery health",
        powerCycles: "Cycles",
        speedTestRun: "Speed test",
        speedTestAgain: "Test again",
        speedTestLatency: "Latency",
        speedTestTesting: "Testing…",
        speedTestFailed: "Test failed",

        monitorShowInPanel: "Show in panel",
        panelHideItem: "Hide from panel",
        panelShowItem: "Show in panel",
        panelHiddenItem: "Hidden",
        monitorItemUptime: "Uptime",
        monitorItemNetSpeed: "Live speed",
        monitorItemNetTotals: "Session totals",
        monitorItemNetTest: "Speed test",
        monitorItemDiskUsage: "Disk usage",
        monitorItemDiskActivity: "Live activity",
        monitorItemDiskSMART: "SMART",
        monitorItemDiskProtection: "External protection",
        monitorItemDiskTools: "Tools",
        monitorPanelConfigHint: "Open a block to choose what it shows.",
        monitorOrderSection: "Section order",
        monitorOrderHint: "Drag to reorder the panel sections and use the eye to show or hide each one.",
        obStepPanelTitle: "What's in the panel",
        obStepPanelBody: "Open each block and pick exactly what shows when you click the icon.",
        obStepPanelNavigationTitle: "Section-based panel",
        obStepPanelNavigationBody: "The panel can now show one section at a time. You can switch between Sections and List in Settings.",

        cleaningMenuItem: "Cleaning Mode",
        utilitiesSection: "Utilities",
        quickControlsSection: "Controls",
        panelCategoryWindows: "Windows",
        panelCategoryInput: "Mouse and keyboard",
        panelCategoryFiles: "Files",
        windowMaximizeName: "Maximize windows",
        windowMaximizeCaption: "The green button maximizes without creating another Space.",
        windowMaximizeActiveNow: "Green button override active",
        windowMaximizeNeedsAccessibility: "Needs Accessibility to work.",
        keyDebounceName: "Debounce",
        keyDebounceEnable: "Filter duplicate keys",
        keyDebounceCaption: "Filters very fast duplicate key presses.",
        keyDebounceActiveNow: "Filter active",
        keyDebounceGlobalWindow: "Global window",
        keyDebouncePerKeySection: "Specific keys",
        keyDebouncePerKeyCaption: "Per-key values override the global window. Use 0 ms to stop filtering a key.",
        keyDebounceKeyLabel: "Key",
        keyDebounceWindowLabel: "Window",
        keyDebounceAddKey: "Add key",
        keyDebounceNoOverrides: "No specific keys configured.",
        keyDebounceRemoveKey: "Remove key",
        cleaningPanelCaption: "Locks the keyboard so you can clean safely.",
        cleaningOverlayTitle: "Keyboard locked for cleaning",
        cleaningOverlaySubtitle: "Press Escape 5 times to unlock",
        cleaningOverlayUnlock: "Unlock",
        cleaningOverlayMouseHint: "Your mouse and trackpad still work",
        cleaningNeedsAxTitle: "Accessibility needed",
        cleaningNeedsAxBody: "To lock the keyboard safely, Kryon needs Accessibility permission. Grant it in System Settings and try again.",

        tabSupport: "Support",
        shortcutsPageCaption: "Edit every global shortcut from the features installed on this Mac. Inactive shortcuts stay saved but do not run.",
        shortcutsPageTitle: "Keyboard shortcuts",
        settingsSearchPlaceholder: "Search settings",
        donateHeading: "Help Kryon keep growing",
        donateMessage: "Kryon is free, independent and built in my spare time. If you would like to contribute financially, Buy Me a Coffee directly helps me keep development moving forward.",
        donateButton: "Support on Buy Me a Coffee",
        donateThanks: "Thank you for being here. 🖤",
        supportIntroTitle: "Help Kryon keep growing",
        supportIntroMessage: "If you would like to support development financially, Buy Me a Coffee is the one place to do it.",
        supportIntroStarButton: "Star Kryon on GitHub",
        supportIntroStarMessage: "Financial support is never expected. A star on GitHub helps more people discover Kryon and makes a real difference to its development.",
        supportIntroCoffeeButton: "Support on Buy Me a Coffee",
        supportIntroLaterButton: "Not now",
        supportIntroDoneButton: "Done",
        discordIntroTitle: "The Kryon Discord community is just getting started",
        discordIntroMessage: "The Kryon community is new and still being built. Join early to meet other users and help build a welcoming space around the app.",
        discordIntroBenefitHelp: "Get help and share workflows",
        discordIntroBenefitFeedback: "Report bugs, request improvements and shape what comes next",
        discordIntroBenefitPreviews: "See work in progress, early previews and release news",
        discordIntroJoinButton: "Join the Discord community",
        communityIntroTitle: "See it before everyone else",
        communityIntroMessage: "People who already followed me on X saw several changes in this update before anyone else. I post previews of what is coming and show how it works, so you already know the basics before the update ships. Follow along and see what comes next!",
        communityIntroFollowButton: "Follow @kryon on X",
        homebrewOfficialIntroTitle: "Now in the official Homebrew catalog",
        homebrewOfficialIntroMessage: "Kryon can now be installed directly from the official Homebrew catalog.",
        homebrewOfficialIntroInstallLabel: "New installation",
        homebrewOfficialIntroMigrationTitle: "Used the old tap?",
        homebrewOfficialIntroMigrationMessage: "Remove the tap once. The app and your settings stay in place.",
        homebrewOfficialIntroCopyButton: "Copy command",
        updateShowcaseTitle: "What's new in 3.1.4",
        updateShowcaseMessage: "Take a quick look at the main improvements in this update.",
        updateShowcaseUnavailable: "The video could not load right now. You can still continue.",
        updateShowcaseRestart: "Restart",
        showMenuBarIcon: "Show menu bar icon",
        showMenuBarIconCaption: "If Kryon's icon disappears (macOS can hide menu bar icons when the bar runs out of room, common on Macs with a notch), reopen Kryon from Applications or Spotlight: that rebuilds the icon and, if it's still hidden, opens this window. The button above does the same when you can already get here. Keeping fewer menu bar icons, or fewer Kryon metrics, makes it far less likely.",
        menuBarIconStillHiddenTitle: "The icon is still hidden",
        menuBarIconStillHiddenBody: "The icon was rebuilt, but macOS did not give it a visible spot. The menu bar is probably out of room: remove some menu bar icons (or close apps with long menus) and try again.",
        menuBarIconManagerHintFormat: "%@ is open and may be keeping the icon in its hidden section. Look for Kryon there, or set %@ to always show Kryon.",
        shortcutRecording: "Press the new shortcut",
        shortcutReset: "Reset",
        shortcutNone: "None",
        shortcutClear: "Remove shortcut",
        shortcutInvalid: "Use at least Control, Option or Command with a key.",
        shortcutPressKeys: "Press keys",
        shortcutEscapeHint: "Escape cancels.",
        shortcutDeleteHint: "Delete clears.",
        shortcutNotCaptured: "Nothing was captured. macOS or another app already uses that combination. Try another one.",
        shortcutConflictFormat: "This shortcut is already used by %@.",
        shortcutUnavailable: "macOS rejected this shortcut. Choose another one.",
        shelfShortcutToggle: "Shelf shortcut",
        switcherUsageHintFormat: "Hold %@ to navigate; release to activate the window. Shift or ← goes back; W closes the window; Q quits the app; Esc cancels.",
        musicBlockSection: "Media keys",
        musicBlockTitle: "Stop Music from opening on its own",
        musicBlockCaption: "The Music app no longer opens when you press the media keys. You can still open it yourself.",
        musicBlockReplacementLabel: "Open instead",
        musicBlockReplacementNone: "None",
        musicBlockChooseApp: "Choose app…",
        cleanerName: "Cleaner",
        cleanerIntroTitle: "Clean up your Mac",
        cleanerIntroCaption: "Scans for leftovers from uninstalled apps, caches, logs and the Trash. You review everything first and removed items go to the Trash.",
        cleanerScan: "Scan",
        cleanerScanning: "Scanning…",
        cleanerCleaning: "Cleaning…",
        cleanerCatLeftovers: "Leftovers from uninstalled apps",
        cleanerCatLoginItems: "Orphaned startup items",
        cleanerCatCaches: "Caches",
        cleanerCatLogs: "Logs",
        cleanerCatDeveloper: "Developer junk",
        cleanerCatTrash: "Trash",
        cleanerLeftoversNote: "Found by analysis and left unchecked. Check the path before ticking.",
        cleanerLoginItemsNote: "The entry under Login Items disappears after restarting the Mac.",
        cleanerTrashNote: "Emptying the Trash is permanent.",
        cleanerCatDeviceBackups: "iPhone backups",
        cleanerDeviceBackupsCaption: "Old iPhone and iPad backups take a big slice of the storage macOS calls Other. Remove only the ones you no longer need; a new backup is made when you plug the device in again.",
        cleanerNothingFound: "Nothing to clean. Your Mac is tidy.",
        cleanerClean: "Clean",
        cleanerDoneNote: "Items went to the Trash and can be recovered from there.",
        cleanerAgain: "Scan again",
        cleanerRevealInFinder: "Reveal in Finder",
        cleanerPanelCaption: "App leftovers, caches and logs",
        cleanerSafeSection: "Safe cleanup",
        cleanerOptionalSection: "Optional, review first",
        cleanerCatOtherCaches: "Other caches",
        cleanerCachesCaption: "Temporary files apps rebuild on their own.",
        cleanerLogsCaption: "Old diagnostic logs.",
        cleanerDeveloperCaption: "Xcode build and simulator leftovers.",
        cleanerLoginItemsCaption: "Startup entries left by apps that no longer exist.",
        cleanerLeftoversCaption: "Files left behind by apps you uninstalled.",
        cleanerOtherCachesCaption: "Safe to remove, nothing breaks. Apps may open slower once and downloaded content, like offline music, downloads again.",
        cleanerCleanSizeFormat: "Clean %@",
        cleanerScheduleTitle: "Automatic cleanup",
        cleanerScheduleOff: "Off",
        cleanerScheduleDaily: "Daily",
        cleanerScheduleWeekly: "Weekly",
        cleanerScheduleCaption: "Cleans only the safe part on its own at the chosen time and sends everything to the Trash.",
        cleanerScheduleLastFormat: "The last automatic cleanup freed %@.",
        cleanerAutoNotificationFormat: "%@ freed and sent to the Trash.",
        cleanerScheduleNextFormat: "Next cleanup %@.",
        cleanerScheduleRanFormat: "Last automatic cleanup %@.",
        cleanerScheduleNotifyToggle: "Notify when done",
        cleanerNotifDenied: "Kryon notifications are turned off in the system.",
        cleanerNotifOpenSettings: "Open Notification Settings…",
        launchAtLoginNeedsApplications: "The app is running from a place that cannot open at login. Drag Kryon to the Applications folder, open it from there and turn this on again.",
        ocrQRToggle: "Read QR codes",
        ocrQRCaption: "If the area has a QR code, its content is shown to copy or open.",
        ocrQRCopied: "QR code copied",
        qrResultTitle: "QR code",
        qrResultCopy: "Copy",
        qrResultOpen: "Open link",
        highlightsTitle: "New in this update",
        highlightsTitleClipboardRedesign: "Redesigned clipboard",
        highlightsCaptionDockPreview: "Dock Preview now works with Dock magnification turned on",
        highlightsCaptionScreenshot: "The screenshot tool gained a pixel loupe and QR code reading",
        highlightsCaptionSnippetLibrary: "A searchable snippet menu types any snippet right at your cursor",
        highlightsCaptionCapturePalette: "One shortcut now opens a floating palette for screenshots, recordings, screen text and colors with nearby controls.",
        highlightsCaptionClipboardRedesign: "Clipboard history now opens as a compact palette with uncluttered rows and an on-demand preview for reading or editing the full item.",
        highlightsConfigure: "Set up",
        highlightsTry: "Try it",
        highlightsSeeAll: "See all changes",
        switcherCurrentSpaceOnly: "Show only the current desktop",
        switcherCurrentSpaceOnlyCaption: "Lists only windows from the desktop you are on. Picking a window never moves you to another desktop.",
        shelfFileMissing: "The file no longer exists",
        previewSizeSmall: "Small",
        mixerSoundEffectsOutputTitle: "System sounds",
        mixerSoundEffectsOutputTooltip: "Choose where alerts and sound effects play",
        monitorOpenActivityMonitor: "Open Activity Monitor",
        dockClickHide: "Click the Dock icon to hide the app",
        dockClickHideCaption: "The active app hides when you click its Dock icon. Click again to bring it back.",
        monitorMemoryMetricLabel: "Measure memory as",
        memoryMetricUsed: "Memory Used",
        memoryMetricApp: "App Memory",
        keepAwakeRightClickToggle: "Right-click the menu bar icon to toggle Keep Awake",
        keepAwakeRightClickToggleCaption: "Replaces the right-click context menu.",
        urlCleanerCustomTitle: "More names to remove",
        urlCleanerCustomPlaceholder: "ref, source",
        urlCleanerCustomCaption: "Separate parameter names with commas. They are removed from every link.",
        urlCleanerCustomSaveButton: "Save",
        switcherSearchPin: "Pin search with S",
        switcherSearchPinCaption: "S starts a search and pins the switcher open, so typing no longer produces special characters when your shortcut uses ⌥, and a search starting with Q or W no longer closes the window or quits the app by mistake.",
        invertVerticalScroll: "Invert vertical scrolling",
        invertHorizontalScroll: "Invert horizontal scrolling",
        switcherShowShortcutHints: "Show shortcut hints",
        switcherShowShortcutHintsCaption: "Shows the app and window shortcuts below the icons.",
        uninstallerHomebrewPackageFormat: "%@ will also be removed from Homebrew.",
        shelfEdgeToggle: "Open near a screen edge",
        shelfEdgeCaption: "Drag a file toward the screen edge to peek the shelf in. Drop it there, or pull back and it retreats.",
        focusFollowsMouseName: "Focus follows mouse",
        focusFollowsMouseCaption: "Focuses and raises the window under the pointer after a short pause.",
        focusFollowsMouseDelay: "Hover delay"
    )
}
