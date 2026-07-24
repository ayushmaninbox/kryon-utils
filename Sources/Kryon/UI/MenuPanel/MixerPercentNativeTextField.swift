// SPDX-License-Identifier: MIT
// Copyright (C) 2026 Ayushman Mohapatra

import AppKit

/// AppKit owns first-responder timing inside a menu-bar popover. SwiftUI can
/// request focus before its backing field has joined the popover window; this
/// hook waits for that attachment and lets the representable retry then.
final class MixerPercentNativeTextField: NSTextField {
    var didAttachToWindow: (() -> Void)?

    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        if window != nil { didAttachToWindow?() }
    }

    @discardableResult
    func focusAndSelectAll() -> Bool {
        guard let window else { return false }
        window.makeKey()
        guard window.makeFirstResponder(self) else { return false }
        selectText(nil)
        return true
    }
}
