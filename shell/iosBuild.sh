#!/bin/sh
#Clean project
flutter clean
#Get dependencies
flutter pub get
#Build .ipa
flutter build ios --release --flavor=prod --no-sound-null-safety
echo "PROD .ipa created"
