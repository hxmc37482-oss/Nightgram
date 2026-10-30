import SwiftUI

private struct NightGramChatGift: Identifiable {
    let id: String
    let name: String
    let symbol: String
    let detail: String
}

private struct NightGramGiftMessage: Identifiable {
    let id = UUID()
    let gift: NightGramChatGift
    let caption: String
    let recipient: String
}

public struct NightGramGiftChatDemoView: View {
    @State private var recipient = "Alex"
    @State private var caption = ""
    @State private var selectedGift: NightGramChatGift?
    @State private var showingGiftPicker = false
    @State private var messages: [NightGramGiftMessage] = []

    private let gifts = [
        NightGramChatGift(id: "rose", name: "Rose", symbol: "🌹", detail: "A little sign of attention"),
        NightGramChatGift(id: "cake", name: "Birthday cake", symbol: "🎂", detail: "Make their day sweeter"),
        NightGramChatGift(id: "trophy", name: "Golden trophy", symbol: "🏆", detail: "For a real champion"),
        NightGramChatGift(id: "planet", name: "Little planet", symbol: "🪐", detail: "A gift from another world"),
        NightGramChatGift(id: "heart", name: "Heart", symbol: "💝", detail: "Sent with warmth"),
        NightGramChatGift(id: "diamond", name: "Diamond", symbol: "💎", detail: "A sparkling surprise")
    ]

    public init() {}

    public var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 34))
                    .foregroundStyle(.tint)
                VStack(alignment: .leading, spacing: 2) {
                    Text(recipient.isEmpty ? "Demo chat" : recipient)
                        .font(.headline)
                    Text("NightGram visual preview")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                Spacer()
                Image(systemName: "gift.fill")
                    .foregroundStyle(.tint)
            }
            .padding()

            Divider()

            ScrollView {
                VStack(spacing: 12) {
                    Text("This is a local demo conversation. Gifts appear here only on this device.")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    if messages.isEmpty {
                        ContentUnavailableView(
                            "No gifts yet",
                            systemImage: "gift",
                            description: Text("Choose a gift below to preview it in this chat.")
                        )
                        .padding(.top, 28)
                    } else {
                        ForEach(messages) { message in
                            HStack {
                                Spacer(minLength: 42)
                                VStack(alignment: .trailing, spacing: 8) {
                                    HStack(spacing: 12) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Gift for \(message.recipient)")
                                                .font(.caption)
                                                .foregroundStyle(.secondary)
                                            Text(message.gift.name)
                                                .font(.headline)
                                        }
                                        Text(message.gift.symbol)
                                            .font(.system(size: 46))
                                    }
                                    .padding(14)
                                    .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 18))
                                    if !message.caption.isEmpty {
                                        Text(message.caption)
                                            .font(.body)
                                            .padding(.horizontal, 12)
                                            .padding(.vertical, 8)
                                            .background(Color.accentColor.opacity(0.12), in: RoundedRectangle(cornerRadius: 14))
                                    }
                                    Text("Just now · local preview")
                                        .font(.caption2)
                                        .foregroundStyle(.tertiary)
                                }
                            }
                        }
                    }
                }
                .padding()
            }

            Divider()

            VStack(spacing: 10) {
                HStack {
                    TextField("Recipient name", text: $recipient)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        showingGiftPicker = true
                    } label: {
                        Image(systemName: "gift.fill")
                            .font(.title2)
                            .frame(width: 44, height: 40)
                    }
                    .buttonStyle(.bordered)
                    .accessibilityLabel("Choose a gift")
                }

                if let gift = selectedGift {
                    HStack {
                        Text(gift.symbol)
                            .font(.title2)
                        Text(gift.name)
                            .font(.subheadline.weight(.semibold))
                        Spacer()
                        Button("Change") { showingGiftPicker = true }
                            .font(.caption)
                    }
                }

                TextField("Add a message (optional)", text: $caption)
                    .textFieldStyle(.roundedBorder)

                Button {
                    guard let gift = selectedGift else { return }
                    let name = recipient.trimmingCharacters(in: .whitespacesAndNewlines)
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                        messages.append(NightGramGiftMessage(
                            gift: gift,
                            caption: caption.trimmingCharacters(in: .whitespacesAndNewlines),
                            recipient: name.isEmpty ? "friend" : name
                        ))
                    }
                    caption = ""
                    selectedGift = nil
                } label: {
                    Label("Show gift in chat", systemImage: "paperplane.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(selectedGift == nil)
            }
            .padding()
            .background(.bar)
        }
        .navigationTitle("Gift chat demo")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showingGiftPicker) {
            NavigationView {
                List(gifts) { gift in
                    Button {
                        selectedGift = gift
                        showingGiftPicker = false
                    } label: {
                        HStack(spacing: 14) {
                            Text(gift.symbol).font(.largeTitle)
                            VStack(alignment: .leading, spacing: 3) {
                                Text(gift.name).foregroundStyle(.primary)
                                Text(gift.detail).font(.caption).foregroundStyle(.secondary)
                            }
                            Spacer()
                            if selectedGift?.id == gift.id {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.tint)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .buttonStyle(.plain)
                }
                .navigationTitle("Choose a gift")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Close") { showingGiftPicker = false }
                    }
                }
            }
        }
    }
}
