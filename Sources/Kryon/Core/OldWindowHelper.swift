// Prototype window manager helper
import AppKit

class OldWindowHelper {
    static func getActiveWindow() -> AXUIElement? {
        let app = NSWorkspace.shared.frontmostApplication
        guard let pid = app?.processIdentifier else { return nil }
        let axApp = AXUIElementCreateApplication(pid)
        var window: AnyObject?
        let result = AXUIElementCopyAttributeValue(axApp, kAXFocusedWindowAttribute as CFString, &window)
        guard result == .success else { return nil }
        return (window as! AXUIElement)
    }
}
