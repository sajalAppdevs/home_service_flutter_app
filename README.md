# Home Service Flutter App 🏠

A modern Flutter application for booking home services like cleaning, plumbing, carpentry, and more. This app provides a seamless experience for users to find and book professional home service providers.

[![Flutter Version](https://img.shields.io/badge/Flutter-stable-blue)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

## 🌟 Features

- User authentication with Firebase
- Multiple service categories:
  - Cleaning Services
  - Plumbing Services
  - Electrical Services
  - Carpentry Services
  - Gardening Services
  - Painting Services
  - Tailoring Services
  - Driver Services
  - Maid Services
- Service provider profiles
- Appointment scheduling
- Real-time status tracking
- Secure payment integration

## 📱 Screenshots

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
    <img src="assets/screenshots/start-page.png" width="200" alt="Start Page">
    <img src="assets/screenshots/home-page.png" width="200" alt="Home Page">
    <img src="assets/screenshots/select-service-page.png" width="200" alt="Service Selection">
    <img src="assets/screenshots/cleaning-page.png" width="200" alt="Cleaning Service">
    <img src="assets/screenshots/date-and-time-page.png" width="200" alt="Schedule Booking">
</div>

## 🛠️ Technologies Used

- Flutter & Dart
- Firebase Authentication
- Firebase Cloud Firestore
- Custom Animations
- Responsive UI Design

## 📋 Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup
- iOS development setup (for iOS deployment)

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/home_service_flutter_app.git
   cd home_service_flutter_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📁 Project Structure

```
lib/
├── animation/         # Custom animations
├── models/           # Data models
├── pages/            # App screens
├── theme/            # App theming
├── utils/            # Utility functions
├── widgets/          # Reusable widgets
└── main.dart         # App entry point
```

## 🔧 Configuration

1. Set up your Firebase project
2. Add your `google-services.json` to the Android app
3. Add your `GoogleService-Info.plist` to the iOS app
4. Update Firebase configuration in `lib/firebase_options.dart`

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Support

For support, email support@homeservice.com or join our Slack channel.

## 🙏 Acknowledgments

- Flutter Team
- Firebase
- All contributors who helped with the project
