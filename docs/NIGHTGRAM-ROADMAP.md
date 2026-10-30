# NightGram v1.0 roadmap

## Prototype files added
- [x] Panel navigation prototype
- [x] Visual gift gallery preview
- [x] Device-local Stars demo counter
- [x] Local appearance preference

## Next engineering steps
- [ ] Inspect Telegram's current Settings navigation and Bazel target structure.
- [ ] Integrate the panel into the app and add the new Swift files to the correct Bazel targets.
- [ ] Configure a reproducible macOS/Xcode build in GitHub Actions.
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
