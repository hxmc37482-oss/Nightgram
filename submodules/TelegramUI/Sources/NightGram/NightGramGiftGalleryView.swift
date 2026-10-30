import SwiftUI

private struct NightGramDemoGift: Identifiable {
    let id: String
    let name: String
    let symbol: String
    let kind: String
}

public struct NightGramGiftGalleryView: View {
    @State private var selectedGift: NightGramDemoGift?

    private let gifts = [
        NightGramDemoGift(id: "rose", name: "Rose", symbol: "🌹", kind: "Classic"),
        NightGramDemoGift(id: "cake", name: "Birthday cake", symbol: "🎂", kind: "Classic"),
        NightGramDemoGift(id: "trophy", name: "Golden trophy", symbol: "🏆", kind: "Collectible-style demo"),
        NightGramDemoGift(id: "planet", name: "Little planet", symbol: "🪐", kind: "Collectible-style demo")
    ]

    public init() {}

    public var body: some View {
        List(gifts) { gift in
            Button {
                selectedGift = gift
            } label: {
                HStack(spacing: 14) {
                    Text(gift.symbol).font(.largeTitle)
                    VStack(alignment: .leading, spacing: 4) {
                        Text(gift.name).foregroundStyle(.primary)
                        Text(gift.kind).font(.caption).foregroundStyle(.secondary)
                    }
                    Spacer()
                    Image(systemName: "chevron.right").foregroundStyle(.tertiary)
                }
                .padding(.vertical, 4)
            }
            .buttonStyle(.plain)
        }
        .navigationTitle("Gift gallery demo")
        .alert(item: $selectedGift) { gift in
            Alert(
                title: Text(gift.name),
                message: Text("Local visual preview only. No Telegram gift is sent and no NFT is created or transferred."),
                dismissButton: .default(Text("OK"))
            )
        }
        .safeAreaInset(edge: .bottom) {
            Text("Preview only — nothing is sent to Telegram.")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.bar)
        }
    }
}
