# Modules 8, 9 & 10: Multi-Screen Navigation, State Management & Animations - MEALS APP

A comprehensive implementation of a Meals application focusing on multi-screen navigation, app-wide state management, and animations in Flutter.

## What We Learned

### Section 8: Building Multi-Screen Apps & Navigation

- **Grid & List-Based UIs**

  - Implementing GridView for category display
  - Creating efficient ListView.builder for meal items
  - Distinguishing between widget and screen architecture

- **Navigation Architecture**

  - Cross-screen navigation with Navigator.push()
  - Passing data between screens
  - Replacing screens with Navigator.pushReplacement()
  - Returning data from screens
  - Tab-based navigation with TabBar and TabBarView
  - Side drawer implementation with Drawer widget

- **Advanced UI Components**
  - Stack widget for layered UI elements
  - InkWell for making widgets tappable with ripple effects
  - PopScope (replacement for WillPopScope) for handling back button behavior
  - Dismissible widget for swipe actions

### Section 9: Managing App-Wide State

- **Riverpod State Management**

  - Understanding state management challenges
  - Setting up Riverpod in Flutter applications
  - Creating basic providers
  - Implementing complex state with StateNotifier
  - Creating dependent providers

- **State Management Patterns**
  - Passing functions through widget layers
  - Combining local widget state with app-wide state
  - Notifier methods for state mutations
  - Consuming provider state in widgets
  - Conditional UI rendering based on state

### Section 10: Adding Animations

- **Animation Concepts**

  - Explicit vs. implicit animations
  - Animation controllers and curves
  - Timed and interactive animations

- **Explicit Animations**

  - Creating and controlling AnimationController
  - Building custom animations with AnimatedBuilder
  - Fine-tuning animation behavior and timing

- **Implicit Animations**
  - Using built-in animated widgets
  - AnimatedContainer for layout transitions
  - Multi-screen transition animations
  - Page transition effects

## Key Implementation Features

- **Category-based Meal Browsing**

  - Visual grid of meal categories
  - Filtering meals by categories
  - Detailed meal information screens

- **Favorites System**

  - Add/remove meals from favorites
  - Persistent favorites state across app
  - Dedicated favorites tab

- **Meal Filtering Options**

  - Dietary preference filters (vegetarian, vegan)
  - Complexity and affordability filters
  - Filter persistence between sessions
  - Filter dialog with toggleable options

- **Animated UI Elements**
  - Animated meal item transitions
  - Interactive button animations
  - Screen transition effects
  - Loading state animations

## Technical Implementation Details

- **Core Components**:

  - Meal and Category data models
  - Screen architecture with AppBar, TabBar, and Drawer
  - Riverpod providers for favorites and filters
  - Custom animated widgets

- **Navigation Structure**:

  - Home screen with categories grid
  - Category meals screen
  - Meal details screen
  - Favorites screen
  - Filters screen
  - Tab controller for main/favorites views
  - Drawer for additional navigation options

- **State Management Implementation**:
  - FavoritesProvider with StateNotifier
  - FiltersProvider for dietary preferences
  - Provider dependencies for filtered meals
  - State-based UI updates

## Dart & Flutter Features Used

- Navigator 2.0 concepts
- TabController management
- Provider pattern with Riverpod
- Animation controllers and tickers
- Custom transition builders
- Theme customization
- Dart collections and filtering operations

## Key Widgets Used

- MaterialApp with named routes
- GridView.builder
- ListView.builder
- TabBar and TabBarView
- Drawer and DrawerHeader
- Stack and Positioned
- AnimatedBuilder
- AnimatedContainer
- Hero transitions
- InkWell and GestureDetector
- Card and ClipRRect
- SwitchListTile
