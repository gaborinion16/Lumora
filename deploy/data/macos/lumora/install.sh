#!/bin/bash
# Installs Lumora.app into /Applications and starts its VPN helper service.
# Run from the unzipped folder:  sudo ./install.sh
set -e

HERE="$(cd "$(dirname "$0")" && pwd)"
SRC_APP="$HERE/Lumora.app"
APP_PATH="/Applications/Lumora.app"
SERVICE_LABEL="AmneziaVPN-service"
SERVICE_GROUP="amnvpn"
PLIST="/Library/LaunchDaemons/AmneziaVPN.plist"

if [ "$(id -u)" -ne 0 ]; then
  echo "Please run with sudo:  sudo \"$0\"" >&2
  exit 1
fi
if [ ! -d "$SRC_APP" ]; then
  echo "Lumora.app was not found next to this script." >&2
  exit 1
fi

echo "Stopping any running copy..."
osascript -e 'tell application "Lumora" to quit' >/dev/null 2>&1 || true
launchctl bootout system "$PLIST" >/dev/null 2>&1 || launchctl unload "$PLIST" >/dev/null 2>&1 || true

echo "Copying Lumora to Applications..."
rm -rf "$APP_PATH"
ditto "$SRC_APP" "$APP_PATH"
# The app is not notarised, so clear the download quarantine flag.
xattr -dr com.apple.quarantine "$APP_PATH" 2>/dev/null || true
chown -R root:wheel "$APP_PATH"
chmod -R a-w "$APP_PATH"

if ! dscl . -read "/Groups/$SERVICE_GROUP" >/dev/null 2>&1; then
  echo "Creating the helper's user group..."
  gid=$(dscl . -list /Groups PrimaryGroupID | awk '{print $2}' | sort -n | awk '$1>=500{g=$1} END{print (g?g+1:501)}')
  dscl . -create "/Groups/$SERVICE_GROUP"
  dscl . -create "/Groups/$SERVICE_GROUP" PrimaryGroupID "$gid"
  dscl . -create "/Groups/$SERVICE_GROUP" RealName "Lumora VPN Service Group"
fi

echo "Starting the VPN helper..."
cat > "$PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$SERVICE_LABEL</string>
    <key>ProgramArguments</key>
    <array>
        <string>$APP_PATH/Contents/MacOS/AmneziaVPN-service</string>
    </array>
    <key>KeepAlive</key>
    <true/>
    <key>RunAtLoad</key>
    <true/>
    <key>GroupName</key>
    <string>$SERVICE_GROUP</string>
</dict>
</plist>
EOF
chown root:wheel "$PLIST"
chmod 644 "$PLIST"
launchctl bootstrap system "$PLIST" 2>/dev/null || launchctl load "$PLIST"
launchctl enable "system/$SERVICE_LABEL" 2>/dev/null || true
launchctl kickstart -k "system/$SERVICE_LABEL" 2>/dev/null || true

echo "Done. Opening Lumora..."
sudo -u "${SUDO_USER:-$USER}" open "$APP_PATH" || true
