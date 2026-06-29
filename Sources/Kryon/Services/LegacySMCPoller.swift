// Legacy SMC polling thread
import Foundation

class LegacySMCPoller {
    private var timer: Timer?
    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) { _ in
            // legacy polling
        }
    }
    func stop() {
        timer?.invalidate()
    }
}
