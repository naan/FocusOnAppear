import Foundation
import SwiftUI

extension View {

    public func focusOnAppear(config: Configuration = .default) -> some View {
        modifier(FocusOnAppearModifierWithoutCondition(config))
    }

    #if os(iOS)

    public func focusOnAppear(_ condition: FocusState<Bool>.Binding, config: Configuration = .default) -> some View {
        modifier(FocusOnAppearModifier(condition, value: true, config: config))
    }

    public func focusOnAppear<Value>(_ condition: FocusState<Value>.Binding,
                                     equals value: Value,
                                     config: Configuration = .default) -> some View where Value: Hashable {
        modifier(FocusOnAppearModifier(condition, value: value, config: config))
    }

    #else

    public func focusOnAppear(_ condition: FocusState<Bool>.Binding, config: Configuration = .default) -> some View {
        self
            .focused(condition)
    }

    public func focusOnAppear<Value>(_ condition: FocusState<Value>.Binding,
                                     equals value: Value,
                                     config: Configuration = .default) -> some View where Value: Hashable {
        self
            .focused(condition, equals: value)
    }

#endif
}
