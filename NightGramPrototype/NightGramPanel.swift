import SwiftUI

/// NightGram's local-only customization panel prototype.
/// Integration into Telegram navigation and Bazel targets is a separate step.
public struct NightGramPanel: View {
    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section("NightGram") {
                    NavigationLink {
                        GiftGalleryDemoView()
                    } label: {
                        Label("Visual gifts demo", systemImage: "gift")
                    }
                    NavigationLink {
                        StarsDemoView()
                    } label: {
                        Label("Stars balance demo", systemImage: "star.circle")
                    }
                    NavigationLink {
                        AppearanceDemoView()
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

private struct AppearanceDemoView: View {
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
