# Lumora

Lumora is a reskinned build of [AmneziaVPN](https://github.com/amnezia-vpn/amnezia-client), an open-source VPN client licensed under **GPL-3.0**. Everything in the upstream README (build steps, dependencies, protocols) still applies.

## What changed

| Area | Change | Files |
|---|---|---|
| Colours | Graphite ground, ivory text, champagne-gold accent. Token names are unchanged, so every control picks them up. | `client/ui/qml/Modules/Style/AmneziaStyle.qml` |
| Type | Inter Tight for UI text, Instrument Serif for display and H1 headings (both SIL OFL, licences in `client/fonts/`). | `client/fonts/`, `client/images/images.qrc`, `client/amneziaApplication.cpp`, `client/ui/qml/Controls2/TextTypes/*`, other QML using `font.family` |
| Name | App display name, organisation and single-instance name set to Lumora. | `client/cmake/branding/common.cmake` |
| Icons | New shield mark: in-app logo, app icon (`.ico`, `.png`, macOS Icon Composer layers), tray icons, Linux launcher icon, wordmark. | `client/images/`, `deploy/data/linux/AmneziaVPN.png` |
| Text | Product-name strings rebranded; About page credits AmneziaVPN and the GPL. | `client/ui/qml/Pages2/*`, `client/ui/qml/Components/UpdateSupportDrawer.qml` |
| Installer | Vendor, title, package file names and uninstaller label say Lumora. | `cmake/CPack.cmake`, `deploy/data/linux/AmneziaVPN.desktop` |
| Updates | Auto-update is **off**, because it points at upstream AmneziaVPN releases. | `client/cmake/branding/common.cmake` |

## Deliberately left as-is

- **Internal names**: executable, service, Swift module, network extension, install directory and resource file names. Renaming them breaks the build or the install scripts (for example `swiftBridge.h` hard-codes `AmneziaVPN-Swift.h`). Users don't normally see these.
- **Protocol names** such as AmneziaWG and AmneziaDNS. These are the technical protocol names.
- **Amnezia's own service**: the "VPN by Amnezia" / Amnezia Premium options, their API gateway, and help links to `docs.amnezia.org`. These still work against Amnezia's servers. Remove or replace them if you don't want to offer that service.

## Before you ship

1. **Replace the placeholders** with your real details. Search the code for `lumora.example`, `YOUR_CHANNEL` and `YOUR-ACCOUNT`.
2. **Apple identifiers**: set your own bundle IDs, app group and provisioning profiles in `client/cmake/branding/apple.cmake`, `ios.cmake` and `macos.cmake`, plus the matching `.entitlements` files. You can't sign with `org.amnezia.*`.
3. **Publish your source.** GPL-3.0 requires that anyone you give the app to can get the full modified source under the same licence. Keep `LICENSE` and the upstream copyright notices.
4. **Check the name.** "Lumora" is a placeholder; check it's free to use before launching.
5. **Servers**: the client still needs a VPN server, either one users set up through the app over SSH, or one you run.

## Building

Follow the upstream README for your platform (Qt 6, CMake, Conan). Run `git submodule update --init --recursive` after cloning.
