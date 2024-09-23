#!/bin/sh
#Clean project
flutter clean
#Get dependencies
flutter pub get
#Build APK
flutter build apk --release --flavor=prod --no-tree-shake-icons
#Build app bundle
flutter build appbundle --release --flavor=prod --no-tree-shake-icons
echo "APK and Appbundle created"
