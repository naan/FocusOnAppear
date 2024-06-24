import Foundation
import SwiftUI

#if os(iOS)

class FirstResponderField: UITextField {
    var languageCode: String?

    init(_ config: Configuration) {
        super.init(frame: .zero)
        keyboardType = config.keyboardType
        returnKeyType = config.returnKeyType
        isSecureTextEntry = config.isSecure
        languageCode = config.languageCode
        becomeFirstResponder()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var textInputMode: UITextInputMode? {
        if let languageCode = languageCode {
            for inputMode in UITextInputMode.activeInputModes {
                if let inputModeLanguage = inputMode.primaryLanguage {
                    let locale = Locale(identifier: inputModeLanguage)
                    if locale.languageCode == languageCode {
                        return inputMode
                    }
                }
            }
        }
        return super.textInputMode
    }
    
}

struct FirstResponderFieldView: UIViewRepresentable {
    typealias UIViewType = FirstResponderField
    typealias Coordinator = Configuration

    private let config: Configuration

    init(_ config: Configuration) {
        self.config = config
    }

    func makeCoordinator() -> Coordinator {
        return config
    }

    func makeUIView(context: Context) -> FirstResponderField {
        return FirstResponderField(context.coordinator)
    }

    func updateUIView(_ uiView: FirstResponderField, context: Context) {
    }
}

#endif
