#!/bin/zsh
# SPDX-License-Identifier: MIT
# Copyright (C) 2026 Ayushman Mohapatra

# Cleanly removes Kryon and every piece of system state it created:
# the login item, TCC permissions, preferences, saved state and (if present)
# the password-free closed-lid sudoers rule. Leaves no dead entries behind.
# Also clears the pre-rename "Kryon Utils.app" if it is still around.
set -uo pipefail

BUNDLE="com.kryon.utils"
APP="/Applications/Kryon.app"
LEGACY_APP="/Applications/Kryon Utils.app"

echo "▸ Quitting…"
pkill -x Kryon 2>/dev/null || true
pkill -x KryonUtils 2>/dev/null || true
sleep 0.5

# Detach from the system from inside whichever bundle still exists: unregisters
# the login item (no BTM tombstone) and restores normal sleep.
for candidate in "$APP/Contents/MacOS/Kryon" "$LEGACY_APP/Contents/MacOS/KryonUtils"; do
    if [[ -x "$candidate" ]]; then
        echo "▸ Detaching login item and restoring sleep…"
        "$candidate" --uninstall || true
        break
    fi
done

echo "▸ Resetting permissions (Accessibility, Screen Recording)…"
tccutil reset All "$BUNDLE" >/dev/null 2>&1 || true

echo "▸ Removing app, preferences and saved state…"
rm -rf "$APP" "$LEGACY_APP"
defaults delete "$BUNDLE" >/dev/null 2>&1 || true
rm -f "$HOME/Library/Preferences/$BUNDLE.plist"
rm -rf "$HOME/Library/Saved Application State/$BUNDLE.savedState"

RULES="/etc/sudoers.d/kryon-clamshell /etc/sudoers.d/kryon-utils-clamshell /etc/sudoers.d/vorss-clamshell"
if ls $RULES >/dev/null 2>&1; then
    echo "▸ Removing closed-lid sudoers rule (asks for your admin password)…"
    osascript -e "do shell script \"rm -f $RULES\" with administrator privileges with prompt \"Kryon uninstaller\"" || true
fi

echo "✓ Kryon fully removed."
