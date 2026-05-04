// Math prototype for 1/2 and 1/4 screen calculations
import Foundation

struct WindowMathPrototype {
    static func halfLeft(screen: CGRect) -> CGRect {
        CGRect(x: screen.minX, y: screen.minY, width: screen.width / 2, height: screen.height)
    }
}
