# Module 14: Chat App with Firebase & Push Notifications

## What I Learned

This module covered building a real-time chat application with Flutter and Firebase, including:

- **Firebase Authentication** - Email/password signup and login
- **Cloud Firestore** - Real-time database for storing and retrieving chat messages
- **Firebase Storage** - Storing user profile images
- **Firebase Cloud Messaging** - Implementing push notifications
- **Firebase Cloud Functions** - Server-side code for automated notifications

## Project Structure

```
lib/
├── firebase_options.dart  - Firebase configuration
├── main.dart              - App initialization and root widget
├── screens/               - Main app screens
│   ├── auth_screen.dart   - Login/signup functionality
│   ├── chat_screen.dart   - Main chat interface
│   └── splash_screen.dart - Loading screen
├── widgets/               - Reusable UI components
│   ├── chat_messages.dart - Message list with Firestore streaming
│   ├── message_bubble.dart - Custom styled chat bubbles
│   ├── new_message.dart   - Message input and sending
│   └── user_image_picker.dart - Profile image selection
└── services/              - Firebase service integrations
```

## Key Implementations

1. **Authentication Flow**

   - Toggle between login/signup modes
   - Form validation with error handling
   - Profile image upload during signup
   - Persistent auth state with StreamBuilder

2. **Chat Functionality**

   - Real-time message streaming with Firestore
   - Custom chat bubble UI with user info
   - Optimized message grouping by sender

3. **Push Notifications**
   - Background message handling
   - Permission requests
   - Topic subscriptions for broadcast messages

## Running the App

1. Set up a Firebase project and configure with FlutterFire CLI
2. Update firebase_options.dart with your project configuration
3. Run `flutter pub get` to install dependencies
4. Launch the app with `flutter run`

## Technologies Used

- Flutter for cross-platform UI
- Firebase Authentication, Firestore, Storage, and Cloud Messaging
- Image picker for camera/gallery access
