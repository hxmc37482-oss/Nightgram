import SwiftUI

/// Device-local demo counter; it never calls Telegram payments or changes account balance.
public struct NightGramStarsDemoView: View {
    @AppStorage("nightgram.demoStars") private var demoStars = 250
    @State private var customAmount = 100

    public init() {}

    public var body: some View {
        Form {
            Section("Demo balance") {
                HStack {
                    Image(systemName: "star.circle.fill").foregroundStyle(.yellow)
                    Text("\(demoStars)").font(.largeTitle.monospacedDigit().bold())
                    Spacer()
                    Text("DEMO")
                        .font(.caption.bold())
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(.yellow.opacity(0.2), in: Capsule())
                }
            }
            Section("Add test Stars") {
                Stepper("Amount: \(customAmount)", value: $customAmount, in: 1...10_000, step: 25)
                Button {
                    demoStars = min(demoStars + customAmount, 1_000_000)
                } label: {
                    Label("Add to demo balance", systemImage: "plus.circle")
                }
                Button("Reset demo balance", role: .destructive) {
                    demoStars = 250
                }
            }
            Section {
                Text("Fictional device-local test points. No purchase, payment, refund, or Telegram Stars transaction occurs.")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("Stars demo")
    }
}
