import SwiftUI

struct ContentView: View {

    @State private var showingSheet = false
    @State private var kind: SheetView.Kind = .text

    var body: some View {
        VStack(spacing: 20) {
            Button("Open TextField") {
                kind = .none
                showingSheet = true
            }
            Button("Open TextField with focusOnAppear") {
                kind = .text
                showingSheet = true
            }
            Button("Open SecureField with focusOnAppear") {
                kind = .password
                showingSheet = true
            }
            Button("Open TextField with Email keyboard") {
                kind = .email
                showingSheet = true
            }
        }
        .sheet(isPresented: $showingSheet) {
            SheetView(kind: $kind)
        }
    }
}

struct SheetView: View {

    enum Kind {
        case none
        case text
        case password
        case email
    }

    @Binding var kind: Kind
    @FocusState var field: Kind?
    @State var text: String = ""
    @FocusState var isFocused: Bool

    var body: some View {
        VStack {
            switch kind {
            case .none:
                TextField("Text", text: $text)
                    .focused($isFocused)
            case .text:
                TextField("Text", text: $text)
                    .focused($isFocused)
                    .focusOnAppear($field, equals: .text)
            case .password:
                SecureField("Password", text: $text)
                    .focusOnAppear($field,
                                   equals: .password,
                                   config: .init(isSecure: true))
            case .email:
                TextField("Email Address", text: $text)
                    .keyboardType(.emailAddress)
                    .focusOnAppear($field,
                                   equals: .email,
                                   config: .init(keyboardType: .emailAddress))
            }
        }
        .scenePadding()
        .onAppear {
            isFocused = true
        }
    }
}
