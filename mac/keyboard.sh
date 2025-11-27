#!/usr/bin/env bash

set -euo pipefail

echo "Disable Fn key changing input source…"
# 0 = Do Nothing, 1 = Change input source, 2 = Emoji, 3 = Dictation :contentReference[oaicite:0]{index=0}
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

echo "Set Option+Space as 'Select previous input source'…"
# AppleSymbolicHotKeys:
#   60 = Select the previous input source
#   61 = Select next source in Input menu :contentReference[oaicite:1]{index=1}
#
# parameters = [keyboardType, keyCode, modifierFlags]
#   32   = ANSI keyboard
#   49   = Space bar keycode
#   524288 = Option modifier (Alt) :contentReference[oaicite:2]{index=2}
#
# This makes: Option + Space

defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '
<dict>
  <key>enabled</key><true/>
  <key>value</key>
  <dict>
    <key>type</key><string>standard</string>
    <key>parameters</key>
    <array>
      <integer>32</integer>
      <integer>49</integer>
      <integer>524288</integer>
    </array>
  </dict>
</dict>'

echo "(Optional) Disable the \"next source\" shortcut if you don't use it…"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 '
<dict>
  <key>enabled</key><false/>
  <key>value</key>
  <dict>
    <key>type</key><string>standard</string>
    <key>parameters</key>
    <array>
      <integer>32</integer>
      <integer>49</integer>
      <integer>524288</integer>
    </array>
  </dict>
</dict>'

# Hotkey ID mapping:
#   28 = Save picture of screen as a file
#   29 = Copy picture of screen to the clipboard
#   30 = Save picture of selected area as a file
#   31 = Copy picture of selected area to the clipboard 
#
# AppleSymbolicHotKeys parameters:
#   [0] = ASCII code
#   [1] = virtual key code
#   [2] = modifier mask 
#
# For Cmd+Shift+A:
#   'a' ASCII         = 97
#   'A' key code      = 0  (A key) 
#   modifiers         = Command + Shift
#                     = 1048576 + 131072
#                     = 1179648 

echo "Setting Cmd+Shift+A for 'Copy picture of selected area to the clipboard'…"

defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 31 '
<dict>
  <key>enabled</key><true/>
  <key>value</key>
  <dict>
    <key>type</key><string>standard</string>
    <key>parameters</key>
    <array>
      <integer>97</integer>        <!-- ASCII for "a" -->
      <integer>0</integer>         <!-- key code for A key -->
      <integer>1179648</integer>   <!-- Command + Shift -->
    </array>
  </dict>
</dict>'

echo "Force macOS to reload keyboard shortcuts…"
# This applies changes to com.apple.symbolichotkeys without reboot :contentReference[oaicite:3]{index=3}
defaults read com.apple.symbolichotkeys >/dev/null 2>&1 || true
/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u

echo "Done. Try pressing Option+Space to switch input source."
echo "- ⌘ + ⇧ + A should now trigger 'Copy picture of selected area to the clipboard'."
echo "If it doesn't take, log out/in or reboot once."
