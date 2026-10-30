import SwiftUI

/// NightGram's local-only settings prototype.
/// The host app must add a navigation entry before users can open this view.
public struct NightGramPanel: View {
    @AppStorage("nightgram.hideReadStatus") private var hideReadStatus = false

    public init() {}

    public var body: some View {
        NavigationView {
            List {
                Section("NightGram") {
                    NavigationLink {
                        NightGramGiftChatDemoView()
                    } label: {
                        Label("Send visual gift (demo chat)", systemImage: "gift.fill")
                    }
                    NavigationLink {
                        NightGramGiftGalleryView()
                    } label: {
                        Label("Visual gifts gallery", systemImage: "gift")
                    }
                    NavigationLink {
                        NightGramStarsDemoView()
                    } label: {
                        Label("Stars balance demo", systemImage: "star.circle")
                    }
                    NavigationLink {
                        NightGramAppearanceView()
                    } label: {
                        Label("Appearance", systemImage: "paintpalette")
                    }
                }
                Section("Privacy") {
                    Toggle("Hide read status", isOn: $hideReadStatus)
                    Text("Saved on this device as a preference preview. This switch does not yet change Telegram's read-receipt network behavior.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
                Section {
                    Label("Demo mode — changes stay on this device", systemImage: "info.circle")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("NightGram PANEL")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

private struct NightGramAppearanceView: View {
    @AppStorage("nightgram.accent") private var accent = "Violet"
    private let choices = ["Violet", "Blue", "Mint", "Rose"]

    var body: some View {
        Form {
            Section("Accent color") {
                Picker("Theme", selection: $accent) {
                    ForEach(choices, id: \.self) { choice in
                        Text(choice).tag(choice)
                    }
                }
            }
            Section {
                Text("This preference is stored locally and does not change Telegram account or server data.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Appearance")
    }
}
