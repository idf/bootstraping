#!/usr/bin/env bash

set -euo pipefail

echo "Enable Standard Function Keys"
defaults write -g com.apple.keyboard.fnState -bool true
killall cfprefsd 2>/dev/null
killall SystemUIServer 2>/dev/null
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u