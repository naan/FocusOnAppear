import Foundation
import SwiftUI

extension View {

    /// Modify this view to set focus when the view appears along with the system keyboard in a single animation.
    /// - Parameter config: Configure the input traits of the view.
    /// - Returns: The modified view.
    public func focusOnAppear(config: Configuration = .default) -> some View {
        modifier(FocusOnAppearModifierWithoutCondition(config))
    }
    
    /// Modify this view to set focus when the view appears along with the system keyboard in a single animation, and bind its focus state to the provided Boolean state value.
    /// - Parameters:
    ///   - condition: The focus state to be bound.
    ///   - config: Configure the input traits of the view.
    /// - Returns: The modified view.
    public func focusOnAppear(_ condition: FocusState<Bool>.Binding, config: Configuration = .default) -> some View {
        #if os(iOS)
        modifier(FocusOnAppearModifier(condition, value: true, config: config))
        #else
            focused(condition)
        #endif
    }
    
    /// Modifies this view to set focus when the view appears along with the system keyboard in a single animation, and bind its focus state to the given state value.
    /// - Parameters:
    ///   - condition: The focus state to be bound.
    ///   - value: The value to match against when determining whether the binding should change.
    ///   - config: Configure the input traits of the view.
    /// - Returns: The modified view.
    public func focusOnAppear<Value>(_ condition: FocusState<Value>.Binding,
                                     equals value: Value,
                                     config: Configuration = .default) -> some View where Value: Hashable {
        #if os(iOS)
        modifier(FocusOnAppearModifier(condition, value: value, config: config))
        #else
            focused(condition, equals: value)
        #endif
    }
}
