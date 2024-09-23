#!/bin/sh
#Clean project
flutter clean
#Get dependencies
flutter pub get
#Build APK
flutter build web --web-renderer auto --no-tree-shake-icons
firebase init
firebase deploy

