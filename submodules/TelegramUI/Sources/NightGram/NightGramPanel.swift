import SwiftUI

/// NightGram's local-only settings prototype.
/// The host app must add a navigation entry before users can open this view.
public struct NightGramPanel: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section("NightGram") {
                    NavigationLink {
                        NightGramGiftGalleryView()
                    } label: {
                        Label("Visual gifts demo", systemImage: "gift")
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
                Section {
                    Label("Demo mode — changes stay on this device", systemImage: "info.circle")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                }
            }
            .navigationTitle("NightGram PANEL")
            .navigationBarTitleDisplayMode(.inline)
        }
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
