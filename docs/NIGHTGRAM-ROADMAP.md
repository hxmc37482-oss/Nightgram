# NightGram v1.0 roadmap

## Prototype and integration
- [x] NightGram panel with visual gift gallery, local Stars demo counter, and appearance preferences.
- [x] Local visual gift-chat demo: choose a gift, add a caption, and display it as a chat bubble.
- [x] Device-local read-status preference preview (not connected to Telegram read receipts).
- [x] Telegram-native ViewController wrapper for the SwiftUI panel.
- [x] Add a NightGram row to Telegram's Settings screen.
- [x] Isolate NightGram as a standalone Bazel module to avoid a TelegramUI/PeerInfoScreen dependency cycle.
- [ ] Run the Xcode 27.1 GitHub Actions build and resolve compiler or build-system errors.
- [ ] Build and test on a real device.
- [ ] Configure signing separately; never commit signing certificates or private keys.

## Planned, not implemented
- Connect visual gift messages to Telegram's actual chat/message pipeline and server-side gift API, subject to Telegram API support.
- Connect read-receipt privacy behavior to Telegram's actual message/read-state pipeline, subject to protocol constraints.
- More theme controls and animated gift previews.

## Safety and transparency
- The gift gallery and gift-chat flow are local visual demos; they do not send Telegram gifts or mint/transfer NFTs.
- The Stars counter is fictional local demo data; it is not a purchase or real Telegram balance.
- The read-status switch currently stores a local preference only; it does not suppress server-side read receipts.
- Do not display simulated payments or assets as real transactions or ownership.
- NightGram is an unofficial client prototype. Respect upstream licensing and use your own Telegram API credentials.
