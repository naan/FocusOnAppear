# FocusOnAppear

SwiftUI's `@FocusState` cannot show a sheet with the system keyboard in a single animation as UIKit can. `focusOnAppear` is a SwiftUI view modifier that enables this functionality.

https://github.com/naan/FocusOnAppear/assets/63257/f07d62c0-0a23-4c74-b11d-e4ffaef3e656

## How It Works

When you apply `focusOnAppear` to a SwiftUI's `TextField` or `SecureField`, the modifier adds a hidden UITextField behind the SwiftUI view. When the view appears on the screen, the hidden UITextField calls `becomeFirstResponder` to gain focus before the SwiftUI view actually appears on the screen, enabling the SwiftUI view to appear with the system keyboard in a single animation.

```swift
// Simply want to focus on appear
TextField("Text", text: $text)
  .focusOnAppear()

// Focus on appear, but also want to control focus state
TextField("Text", text: $text)
  .focusOnAppear($isFocused)
TextField("Text", text: $text)
  .focusOnAppear($field, equals: .email)

// When using SecureField
SecureField("Password", text: $password)
  .focusOnAppear(config: .init(isSecure: true))
```

## Customize

Because `focusOnAppear` uses the hidden `UITextField` then switches focus to the SwiftUI View, you want to match the keyboard type, return key type, and whether the text input is secure or not, so the keyboard doesn't change when the view appears.

## Limitation

This modifier only works when the view is presented in a `sheet`. If the view is presented in a `NavigationStack`, it still works, but you'll see the system keyboard appears in a glitchy animation.

## License

focusOnAppear is available under the MIT license. See [LICENSE](LICENSE) for more information.
