import SwiftUI

#if os(iOS)

struct FocusOnAppearModifier<Value>: ViewModifier where Value: Hashable {

    private var condition: FocusState<Value>.Binding
    private var value: Value
    private let config: Configuration

    init(_ condition: FocusState<Value>.Binding,
         value: Value,
         config: Configuration = .default) where Value: Hashable {
        self.condition = condition
        self.value = value
        self.config = config
    }

    func body(content: Content) -> some View {
        return ZStack {
            FirstResponderFieldView(config)
                .frame(width: 0, height: 0)
                .opacity(0)
            content
                .focused(condition, equals: value)
                .onTapGesture {
                    condition.wrappedValue = value
                }
                .onAppear {
                    condition.wrappedValue = value
                }
        }
    }
}

#endif

struct FocusOnAppearModifierWithoutCondition: ViewModifier {

    @FocusState private var isFocused: Bool
    private let config: Configuration

    init(_ config: Configuration = .default) {
        self.config = config
    }

    func body(content: Content) -> some View {
        #if os(iOS)
        return ZStack {
            FirstResponderFieldView(config)
                .frame(width: 0, height: 0)
                .opacity(0)
            content
                .focused($isFocused)
                .onTapGesture {
                    isFocused = true
                }
                .onAppear {
                    isFocused = true
                }
        }
        #else
        return content
            .focused($isFocused)
            .onAppear {
                isFocused = true
            }
        #endif
    }
}
