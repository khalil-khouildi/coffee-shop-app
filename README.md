# ☕ Brew Crew - Coffee Shop App

A beautifully crafted Flutter mobile application for coffee enthusiasts to track and customize their brew preferences. Built with Firebase for real-time synchronization and authentication.

![Flutter](https://img.shields.io/badge/Flutter-3.29+-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.7+-blue?logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Integrated-orange?logo=firebase)
![License](https://img.shields.io/badge/License-MIT-green)

---

## 📱 Features

### 🔐 Authentication
- Email & Password Sign Up with validation
- Email & Password Sign In
- Anonymous Sign In option
- Persistent sessions
- Sign Out functionality

### ☕ Brew Management
- Create personalized brew profiles
- Customizable name
- Sugar preference (0–4 sugars)
- Strength control slider (100–900)
- Real-time Firestore sync

### 🎨 User Interface
- Clean Material Design
- Coffee-themed warm brown tones
- Smooth loading animations
- Form validation
- Responsive layout

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| Flutter | Cross-platform UI framework |
| Firebase Auth | User authentication |
| Cloud Firestore | Real-time database |
| Provider | State management |
| SpinKit | Loading animations |

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.12.1
  firebase_auth: ^5.5.1
  cloud_firestore: ^5.6.5
  provider: ^6.1.2
  flutter_spinkit: ^5.2.1
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.29+)
- Android Studio or VS Code
- Firebase Account

### Installation

1. **Clone the repository**
```bash
   git clone https://github.com/khalil-khouildi/coffee-shop-app.git
   cd coffee-shop-app
```

2. **Install dependencies**
```bash
   flutter pub get
```

3. **Firebase Setup**
   - Create a Firebase project
   - Enable Email/Password authentication
   - Create Firestore database in test mode
   - Download `google-services.json` and place in `android/app/`

4. **Run the app**
```bash
   flutter run
```

---

## 🎮 Usage

### First Time
1. Click **Register**
2. Enter email and password (6+ characters)
3. Create account

### Setting Up Brew Profile
1. Click **Settings** in AppBar
2. Enter your name
3. Select sugar preference
4. Adjust strength with slider
5. Click **Update**

---

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| Firebase init failed | Check `google-services.json` location |
| Provider not found | Verify `StreamProvider` setup |
| Sign in fails | Enable Email/Password in Firebase Console |

---

## 📈 Future Enhancements

- Coffee bean type selection
- Brewing method options
- Favorite recipes
- Dark mode
- Push notifications

---


## 👨‍💻 Author

**Khalil Khouildi**  
GitHub: [@khalil-khouildi](https://github.com/khalil-khouildi)

---

<p align="center">Made with ☕ and ❤️</p>
