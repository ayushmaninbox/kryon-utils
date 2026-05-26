// Old polling-based pasteboard watcher
import AppKit

class OldPasteboardWatcher {
    private var changeCount = 0
    func check() -> Bool {
        let count = NSPasteboard.general.changeCount
        if count != changeCount {
            changeCount = count
            return true
        }
        return false
    }
}
