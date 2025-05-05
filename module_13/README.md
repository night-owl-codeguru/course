# Favorite Places App (Module 13)

A Flutter application showcasing native device features integration. This project demonstrates practical implementation of various device features and data persistence.

## Key Features Implemented

### Camera Integration

- Implemented image picking using `image_picker` package
- Camera access for taking pictures
- Image preview functionality
- Local image storage

### Location Features

- Current location detection using `location` package
- Google Maps integration
- Location preview with static maps
- Manual location selection via map taps
- Geocoding for address lookup

### Data Persistence

- Local SQL database implementation
- Image file system storage
- Place data management
- Async data loading with FutureBuilder

### Architecture & State Management

- Riverpod for state management
- Provider pattern implementation
- Model-driven development
- Clean architecture principles

## Technical Stack

- Flutter
- Provider + Riverpod
- SQLite
- Google Maps API
- Image Picker
- Location Services

## Screens

1. Places Overview Screen
2. Add Place Screen
3. Place Details Screen
4. Map Screen (for location picking)

## Getting Started

### Prerequisites

1. Get a Google Maps API key
2. Enable required permissions in Android/iOS
   - Camera
   - Location
   - Storage

### Configuration

Add your Google Maps API key in:

- Android: `android/app/src/main/AndroidManifest.xml`
- iOS: `ios/Runner/AppDelegate.swift`

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
