import Foundation
import SwiftUI

#if os(iOS)

class FirstResponderField: UITextField {

    init(_ config: Configuration) {
        super.init(frame: .zero)
        keyboardType = config.keyboardType
        returnKeyType = config.returnKeyType
        isSecureTextEntry = config.isSecure
        becomeFirstResponder()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
