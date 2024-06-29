import Foundation
import SwiftUI

/// A configuration for `focusOnAppear` modifier.
public struct Configuration {
    /// Configure the keyboard type for the input field when `focusOnAppear` is applied.
    public let keyboardType: KeyboardType
    /// Configure the return key type for the input field when `focusOnAppear` is applied.
    public let returnKeyType: ReturnKeyType
    /// A Boolean value that indicates whether the input field is `SecureField`.
    public let isSecure: Bool
    /// Configure the language of the keyboard
    public let languageCode: String?

    /// Initialize `Configuration` with the given parameters.
    public init(keyboardType: KeyboardType = .default, returnKeyType: ReturnKeyType = .default, isSecure: Bool = false, languageCode: String? = nil) {
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.isSecure = isSecure
        self.languageCode = languageCode
    }

    /// The default configuration for `focusOnAppear`.
    static public let `default` = Configuration()
}
