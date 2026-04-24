<div align="center">

<img src="Resources/Brand/logo.png" width="130" height="130" alt="Kryon Logo" style="border-radius: 28px; box-shadow: 0 12px 36px rgba(0, 0, 0, 0.35);" />

# Kryon

**The Ultimate Native Utility Hub & System Companion for macOS**

[![macOS 14.0+](https://img.shields.io/badge/macOS-14.0%2B%20Sonoma%20%2F%20Sequoia-000000?style=for-the-badge&logo=apple&logoColor=white)](https://apple.com)
[![Swift 5.9](https://img.shields.io/badge/Swift-5.9-FA7343?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org)
[![Apple Silicon & Intel](https://img.shields.io/badge/Architecture-Universal%20Binary-007AFF?style=for-the-badge&logo=apple&logoColor=white)](https://apple.com)
[![Release v0.1.0](https://img.shields.io/badge/Release-v0.1.0-34C759?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ayushmaninbox/kryon-utils/releases/tag/v0.1.0)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue?style=for-the-badge)](LICENSE)

<p align="center">
  <a href="#-overview">Overview</a> •
  <a href="#-features">Features</a> •
  <a href="#-installation">Installation</a> •
  <a href="#-terminal-commands--cli">Terminal CLI</a> •
  <a href="#-permissions-guide">Permissions</a> •
  <a href="#-building-from-source">Build from Source</a>
</p>

</div>

---

## ⚡ Overview

**Kryon** is an ultra-fast, open-source macOS utility suite engineered natively in Swift, AppKit, and SwiftUI. It replaces 15+ disparate background helpers with a single, high-performance menu bar companion.

From keyboard-driven window snapping and custom mouse physics to Apple Silicon hardware telemetry, per-app audio mixing, screenshot annotations, and clipboard management — **Kryon unites your daily desktop workflow in one seamless native tool.**

---

## ✨ Features

<table>
<tr>
<td width="50%" valign="top">

### 🪟 Windows & Dock
- **Snap Layouts**: Snap windows to halves, thirds, quarters, and custom coordinates with global shortcuts or mouse drag gestures.
- **Dock Previews**: Hover over running Dock items to inspect live window thumbnails with instant close/minimize buttons.
- **Smart Maximizer**: Borderless maximization with traffic light hit-testing.
- **Dock Click Controls**: Middle-click to quickly hide or quit apps.
- **Auto-Quit**: Automatically quits background idle apps to reclaim RAM.

</td>
<td width="50%" valign="top">

### 🖱️ Mouse & Keyboard Ergonomics
- **Smooth Scrolling**: Physics-based momentum and bezier deceleration for standard third-party mice.
- **Scroll Inverter**: Invert discrete mouse wheel direction independently from trackpad gestures.
- **Focus Follows Mouse**: Automatic window focus on hover with configurable delay.
- **Button Remapping**: Map auxiliary mouse buttons 3/4/5 to Mission Control or custom actions.
- **Keyboard Debounce**: Hardware chatter filter for mechanical keyboards.
- **Text Snippets & SuperKey**: Keyword macro expansions & Caps Lock Hyper key.

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📋 Clipboard & Files
- **Clipboard History**: Searchable history buffer with image previews and password manager security exclusions.
- **Paste Plain Text**: Global hotkey to strip rich styles and paste pure text.
- **Finder Cut & Paste**: Real `Cmd + X` and `Cmd + V` file moving in Finder.
- **Desktop Shelf**: Edge drop zone for holding files across full-screen spaces.
- **URL Cleaner**: Strips UTM tags, affiliate tracking, and query junk on copy.
- **Auto DMG Installer**: Mounts, stages to `/Applications`, and unmounts `.dmg`s in 1 click.

</td>
<td width="50%" valign="top">

### 🔊 Audio, Display & Power
- **Per-App Audio Mixer**: Adjust volume sliders for individual running apps.
- **Output Switcher**: Instant menu bar switching between audio devices.
- **Mic Mute HUD**: Global microphone toggle with animated on-screen HUD.
- **Keep Awake**: Prevent sleep indefinitely, on a timer, or during terminal tasks.
- **External Monitor Brightness**: Hardware DDC/CI control + software gamma scaling.
- **XDR Extra Brightness**: Boost Liquid Retina XDR displays up to 1600 nits.

</td>
</tr>
<tr>
<td width="50%" valign="top">

### 📊 System Telemetry & SMC
- **Live Menu Bar Graphs**: Real-time sparklines for CPU, GPU, RAM, Disk, and Network speeds.
- **Apple Silicon Thermals**: Precise CPU cluster, GPU die, casing, and battery sensor temperatures.
- **Custom Fan Curves**: RPM monitoring and customizable temperature curves via secure privileged helper.
- **Battery Diagnostics**: Wattage draw, discharge rate, cycle count, and remaining runtime.

</td>
<td width="50%" valign="top">

### 🛠️ Developer & Power Tools
- **Command Bar**: Fuzzy-search launcher for apps, shell scripts, and math evaluations.
- **Screen OCR**: Instant text grabber via Apple Vision framework.
- **Screen & Audio Recorder**: High-FPS screen capture with animated GIF export.
- **Screenshot Editor**: Annotate with arrows, rectangles, text, and blur/redact.
- **Color Picker**: Pixel-accurate loupe with HEX/RGB/HSL clipboard copying.
- **Cleaning Mode**: Locks keyboard and trackpad for physical Mac cleaning.
- **App Cleaner**: Deep scanner to purge leftover cache and application support files.

</td>
</tr>
</table>

---

## 🚀 Installation

### Option 1: Direct Download (DMG)

1. Download the latest release: [**`Kryon-0.1.0.dmg`**](https://github.com/ayushmaninbox/kryon-utils/releases/tag/v0.1.0).
2. Open the disk image and drag **Kryon.app** into `/Applications`.
3. Launch **Kryon** from Spotlight or Launchpad.

> [!IMPORTANT]  
> **macOS Gatekeeper First Launch**:  
> If macOS displays *"Kryon cannot be opened because Apple cannot check it for malicious software"*, either:
> - **Right-click (Control-click)** `Kryon.app` in Finder and select **Open**.
> - Or run the Terminal command below to remove the quarantine flag.

---

## 💻 Terminal Commands & CLI

### 1. Removing Quarantine Attribute
```bash
xattr -cr /Applications/Kryon.app
```

### 2. Built-in CLI Utilities
Kryon includes native diagnostic and management tools built right into the executable:

```bash
# Run comprehensive self-test suite
/Applications/Kryon.app/Contents/MacOS/Kryon --selftest

# Dump Apple Silicon / Intel SMC hardware temperature sensors & fan RPM
/Applications/Kryon.app/Contents/MacOS/Kryon --sensors

# Completely uninstall helper daemons and clean preferences
/Applications/Kryon.app/Contents/MacOS/Kryon --uninstall
```

---

## 🔒 Permissions Guide

Kryon uses native macOS APIs to deliver background window management, event tapping, and telemetry. You can grant access in **System Settings > Privacy & Security**:

| Permission | Purpose in Kryon |
| :--- | :--- |
| **Accessibility** | Window snapping, keyboard shortcuts, middle-click emulation, Focus Follows Mouse, and Dock integration. |
| **Screen Recording** | Window previews, color picker loupe, screen OCR text grabber, and screen recorder. *(All processed 100% locally on-device).* |
| **Input Monitoring** | Global hotkeys, mouse button remapping, and mechanical keyboard debounce. |
| **Full Disk Access** *(Optional)* | Deep App Cleaner, cache purger, and Finder batch renamer. |
| **Audio Capture** *(Optional)* | Per-app audio mixer volume tapping and Screen Recorder system audio capture. |

---

## 🛠️ Building from Source

### Prerequisites
- macOS 14.0 (Sonoma) or macOS 15.0+ (Sequoia)
- Xcode 15.0+ or Command Line Tools (`xcode-select --install`)
- Swift 5.9+

### Build Steps

```bash
# 1. Clone the repository
git clone https://github.com/ayushmaninbox/kryon-utils.git
cd kryon-utils

# 2. Setup local signing identity (optional, preserves permissions across rebuilds)
./Tools/setup-signing.sh

# 3. Build release app bundle
./build.sh

# 4. Build and install directly into /Applications
./build.sh --install

# 5. Package distributable DMG
./Tools/make-dmg.sh
```

---

## 📄 License

Distributed under the **MIT License**. See [`LICENSE`](LICENSE) for details.

<div align="center">

Made with ❤️ by [Ayushman Mohapatra](https://github.com/ayushmaninbox)

</div>
