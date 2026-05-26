# Tamenny App

Tamenny is a comprehensive healthcare mobile application built with Flutter that connects users with healthcare services, medical information, and a supportive community.

## 📱 Project Overview

Tamenny aims to improve healthcare accessibility by providing a platform where users can:
- Access medical information and latest news
- Connect with nearby doctors
- Scan and analyze health conditions
- Interact with an AI-powered medical chatbot
- Participate in a health-focused community

## ✨ Key Features

### 🏥 Home Dashboard
- Latest medical news and articles
- Health tips and recommendations
- Quick access to nearby doctors
- Recent health scan results
- Search functionality for medical information

### 🔍 Health Scanning
- Upload medical images for analysis
- AI-powered diagnosis suggestions
- Step-by-step scanning process
- Scan history and results tracking

### 🗺️ Nearby Doctors
- Map-based doctor locator
- Doctor profiles and specialties
- Contact information and directions
- Filtering options for finding specialists

### 💬 Medical Chatbot
- AI-powered medical assistant
- Health-related questions and answers
- Symptom analysis and recommendations
- Powered by Google Generative AI

### 👥 Community
- Health discussion forum
- Post and comment functionality
- Share experiences and advice
- Privacy controls for sensitive information

### 👤 User Profile
- Personal information management
- Password and security settings
- Privacy center
- FAQ section

## 🛠️ Technical Architecture

### Frontend
- **Flutter Framework**: Cross-platform UI development
- **Bloc Pattern**: State management using flutter_bloc
- **Clean Architecture**: Separation of concerns with domain, data, and presentation layers
- **Localization**: Multi-language support with flutter_localizations
- **Responsive Design**: Adapts to different screen sizes

### Backend Services
- **Firebase**: Authentication, Cloud Firestore, and Messaging
- **Supabase**: Storage and additional backend functionality
- **Google Generative AI**: Powers the medical chatbot

### Key Libraries
- **flutter_bloc**: State management
- **dio**: HTTP client for API requests
- **flutter_map**: Map integration for doctor location
- **hive**: Local data persistence
- **image_picker**: Media selection for health scans
- **firebase_auth**: User authentication
- **cloud_firestore**: NoSQL database

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (^3.5.4)
- Dart SDK
- Android Studio / Xcode
- Firebase project setup
- Supabase project setup

### Installation

1. Clone the repository
   ```
   git clone https://github.com/yourusername/tamenny_app.git
   cd tamenny_app
   ```

2. Install dependencies
   ```
   flutter pub get
   ```

3. Run the app
   ```
   flutter run
   ```

### Configuration

1. Firebase Setup
   - Create a Firebase project
   - Add Android/iOS apps to your Firebase project
   - Download and add the google-services.json/GoogleService-Info.plist to your project

2. Supabase Setup
   - Create a Supabase project
   - Configure storage buckets for image uploads
   - Add your Supabase URL and key to the project

3. Google Generative AI
   - Set up API access for the chatbot functionality

## 📋 Project Structure

```
lib/
├── config/                 # App configuration
├── core/                   # Core functionality
│   ├── cubits/             # Global state management
│   ├── functions/          # Utility functions
│   ├── routes/             # Navigation routes
│   └── services/           # App-wide services
├── features/               # App features
│   ├── auth/               # Authentication
│   ├── chatbot/            # AI medical assistant
│   ├── community/          # Social features
│   ├── home/               # Main dashboard
│   ├── map/                # Doctor location
│   ├── onboarding/         # User onboarding
│   ├── profiel/            # User profile
│   ├── scan/               # Health scanning
│   └── splash/             # App startup
└── generated/              # Generated files (localization)
```

## 🌐 Localization

Tamenny supports multiple languages with a localization system that allows for easy translation and adaptation to different regions.

## 🎨 Theming

The app supports both light and dark themes, with a theme switcher in the user profile settings.

## 👨‍💻 Development Team

[Your team information here]

## 📄 License

[Your license information here]

---

Developed with ❤️ for better healthcare accessibility.
