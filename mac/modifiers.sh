#!/usr/bin/env bash
set -euo pipefail

echo "[1] Discovering keyboard IDs (VendorID-ProductID-0)…"

# Find all IOHIDKeyboard devices and extract VendorID/ProductID
ids="$(
  ioreg -n IOHIDKeyboard -r 2>/dev/null \
    | awk '
        /"VendorID"/ { v=$3 }
        /"ProductID"/ {
          p=$3
          gsub(/[^0-9]/, "", v)
          gsub(/[^0-9]/, "", p)
          print v "-" p "-0"
        }
      ' \
    | sort -u
)"

if [ -z "$ids" ]; then
  echo "[!] No keyboard IDs detected from IOHIDKeyboard. Falling back to generic 0-0-0."
  ids="0-0-0"
else
  echo "[+] Found keyboard IDs:"
  printf '    %s\n' $ids
fi

echo
echo "[2] Backing up ByHost GlobalPreferences to Desktop…"
mkdir -p "$HOME/Desktop"
cp "$HOME/Library/Preferences/ByHost/.GlobalPreferences"* \
   "$HOME/Desktop/GlobalPreferences.backup.plist" 2>/dev/null || true

# Old-style modifier mapping codes (not HID usage codes):
#   0 = Caps Lock, 2 = Control, 3 = Option, 4 = Command 
CAPS=0
CTRL=2

echo
echo "[3] Writing persistent Caps→Ctrl mapping for each keyboard ID…"

for id in $ids; do
  key="com.apple.keyboard.modifiermapping.${id}"
  echo "    - Setting $key"
  defaults -currentHost write -g "$key" -array \
  "<dict>
     <key>HIDKeyboardModifierMappingSrc</key>
     <integer>${CAPS}</integer>
     <key>HIDKeyboardModifierMappingDst</key>
     <integer>${CTRL}</integer>
   </dict>"
done

echo
echo "[4] Applying mapping immediately for this session with hidutil…"
/usr/bin/hidutil property --set '{
  "UserKeyMapping": [
    {
      "HIDKeyboardModifierMappingSrc": 0x700000039,
      "HIDKeyboardModifierMappingDst": 0x7000000E0
    }
  ]
}'

echo "- Caps Lock should behave as Control immediately (hidutil)."
