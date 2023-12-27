#!/bin/bash

set -euo pipefail

APPLE_ID="humbleme@protonmail.com"
APPLE_ID_PASSWORD="qrrt-kqjq-fupl-cvcu"
TEAM_ID="6NFV336UD2"

dart --enable-experiment=native-assets build bin/celest.dart --output=celest
mv celest/celest.exe celest/celest
cat << EOF > entitlements.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>com.apple.security.cs.allow-unsigned-executable-memory</key>
  <true/>
  <key>com.apple.security.cs.disable-library-validation</key>
  <true/>
</dict>
</plist>
EOF
codesign --force --options runtime --sign "Developer ID Application: HumbleMe, Inc. (6NFV336UD2)" --prefix "com.humbleme." --entitlements entitlements.plist --timestamp celest/celest
codesign --verify --verbose celest/celest
# If fails, run this to get more info
codesign --display --verbose=4 celest/celest
codesign --display --entitlements - celest/celest
rm celest.zip || true
zip -r celest.zip celest
xcrun notarytool submit --apple-id=$APPLE_ID --password=$APPLE_ID_PASSWORD --team-id=$TEAM_ID --wait celest.zip
# If fails, run this command to get the log
# xcrun notarytool log --apple-id=$APPLE_ID --password=$APPLE_ID_PASSWORD --team-id=$TEAM_ID 0dabeae4-a5eb-4b4d-8265-90307f067b47

# Create pkg
# productbuild --root celest --identifier com.humbleme.celest --version="0.1.0" --install-location --sign "Developer ID Installer: HumbleMe, Inc. (6NFV336UD2)" celest.pkg
