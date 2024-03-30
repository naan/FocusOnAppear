import Foundation
import SwiftUI

public struct Configuration {
    public let keyboardType: KeyboardType
    public let returnKeyType: ReturnKeyType
    public let isSecure: Bool

    public init(keyboardType: KeyboardType = .default, returnKeyType: ReturnKeyType = .default, isSecure: Bool = false) {
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.isSecure = isSecure
    }

    static public let `default` = Configuration()
}
