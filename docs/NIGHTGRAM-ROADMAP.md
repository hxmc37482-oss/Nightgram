# NightGram v1.0 roadmap

## Prototype files added
- [x] Panel navigation prototype
- [x] Visual gift gallery preview
- [x] Device-local Stars demo counter
- [x] Local appearance preference
- [x] UIKit presentation entry point for the NightGram panel

## Integration and release status
- [ ] Add a navigation row to Telegram's existing Settings screen that presents `makeNightGramPanelController()`.
- [ ] Verify the SettingsUI/TelegramUI navigation boundary and avoid introducing a circular Bazel dependency.
- [ ] Run the Xcode 27.1 GitHub Actions build and resolve compiler or build-system errors.
- [ ] Build and test on a real device.
- [ ] Configure signing separately; never commit signing certificates or private keys.

## Planned, not implemented
- Privacy controls for read receipts, subject to Telegram protocol and UI constraints.
- More theme controls and animated gift previews.

## Safety and transparency
- The gift gallery is a visual demo; it does not send gifts or mint/transfer NFTs.
- The Stars counter is fictional local demo data; it is not a purchase or real Telegram balance.
- Do not display simulated payments or assets as real transactions or ownership.
- NightGram is an unofficial client prototype. Respect upstream licensing and use your own Telegram API credentials.
