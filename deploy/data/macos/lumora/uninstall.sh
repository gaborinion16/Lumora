#!/bin/bash
# Removes Lumora and its VPN helper service.  Run:  sudo ./uninstall.sh
if [ "$(id -u)" -ne 0 ]; then
  echo "Please run with sudo:  sudo \"$0\"" >&2
  exit 1
fi
PLIST="/Library/LaunchDaemons/AmneziaVPN.plist"
osascript -e 'tell application "Lumora" to quit' >/dev/null 2>&1 || true
launchctl bootout system "$PLIST" >/dev/null 2>&1 || launchctl unload "$PLIST" >/dev/null 2>&1 || true
rm -f "$PLIST"
rm -rf /Applications/Lumora.app
echo "Lumora has been removed."
