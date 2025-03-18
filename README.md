# Smashtastic Cricket

A cricket game built with Flutter, featuring realistic physics and intuitive controls.

## Features

- Realistic cricket ball physics
- Intuitive batting controls
- Score tracking
- Multiple game modes
- Google Play Games integration
- In-app purchases
- AdMob integration

## Development Setup

1. Make sure you have Flutter installed on your system
2. Clone this repository
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Create the following directories and add required assets:
   ```
   assets/
   ├── sprites/
   │   ├── ball.png
   │   ├── bat.png
   │   ├── background.png
   │   └── player.png
   └── audio/
       ├── hit.wav
       ├── miss.wav
       ├── boundary.wav
       └── six.wav
   ```

## Production Deployment Checklist

### 1. Asset Preparation
- [ ] Convert SVG sprites to PNG format (recommended size: 2x for retina displays)
- [ ] Optimize PNG files using tools like `pngquant` or `optipng`
- [ ] Add proper sound effects in WAV format (keep under 1MB each)
- [ ] Create app icon in various sizes (use `flutter_launcher_icons` package)
- [ ] Create splash screen image

### 2. Code Optimization
- [ ] Run `flutter analyze` to check for code issues
- [ ] Run `flutter test` to ensure all tests pass
- [ ] Enable Flutter's performance overlay to check frame rates
- [ ] Implement proper error handling and crash reporting
- [ ] Add loading indicators for asset loading
- [ ] Implement proper state management
- [ ] Add proper logging for debugging

### 3. Google Play Games Setup
1. Create a Google Play Console account
2. Create a new game project
3. Configure OAuth 2.0 credentials
4. Add the following to `android/app/build.gradle`:
   ```gradle
   dependencies {
       implementation 'com.google.android.gms:play-services-games:23.1.0'
   }
   ```
5. Add your Google Play Games configuration to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <meta-data
       android:name="com.google.android.gms.games.APP_ID"
       android:value="YOUR_APP_ID"/>
   ```

### 4. AdMob Integration
1. Create an AdMob account
2. Create app and ad unit IDs
3. Add the following to `android/app/src/main/AndroidManifest.xml`:
   ```xml
   <meta-data
       android:name="com.google.android.gms.ads.APPLICATION_ID"
       android:value="YOUR_ADMOB_APP_ID"/>
   ```
4. Initialize AdMob in your app:
   ```dart
   await MobileAds.instance.initialize();
   ```

### 5. In-App Purchases Setup
1. Create products in Google Play Console
2. Add the following to `android/app/build.gradle`:
   ```gradle
   dependencies {
       implementation 'com.android.billingclient:billing-ktx:6.0.1'
   }
   ```
3. Configure product IDs in your code
4. Implement purchase flow and verification

### 6. Android Release Configuration
1. Update `android/app/build.gradle`:
   ```gradle
   android {
       defaultConfig {
           applicationId "com.yourcompany.smashtasticcricket"
           minSdkVersion 21
           targetSdkVersion 33
           versionCode 1
           versionName "1.0.0"
       }
   }
   ```
2. Create keystore for signing:
   ```bash
   keytool -genkey -v -keystore android/app/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
3. Configure signing in `android/key.properties`:
   ```properties
   storePassword=<password>
   keyPassword=<password>
   keyAlias=upload
   storeFile=upload-keystore.jks
   ```

### 7. Build Release APK/Bundle
1. Build release APK:
   ```bash
   flutter build apk --release
   ```
2. Build App Bundle (recommended):
   ```bash
   flutter build appbundle --release
   ```

### 8. Google Play Store Submission
1. Create store listing:
   - App description
   - Screenshots
   - Feature graphic
   - Privacy policy
   - Content rating questionnaire
2. Upload APK/Bundle
3. Fill in store listing details
4. Set up pricing and distribution
5. Submit for review

### 9. Post-Launch
1. Monitor crash reports
2. Track analytics
3. Gather user feedback
4. Plan updates and improvements

## Running the Game

1. Connect a device or start an emulator
2. Run the game:
   ```bash
   flutter run
   ```

## Game Controls

- Tap and drag to control the bat angle
- Release to swing the bat
- Try to hit the ball at the right angle to score runs
- Different hit angles result in different scores:
  - Perfect hit (0.8+ quality): 6 runs
  - Good hit (0.5+ quality): 4 runs
  - Normal hit: 1 run

## Development

The game is built using:
- Flutter for the UI and game logic
- Flame game engine for physics and rendering
- Google Play Games for leaderboards and achievements
- AdMob for monetization
- In-app purchases for additional features

## License

This project is licensed under the MIT License - see the LICENSE file for details. 