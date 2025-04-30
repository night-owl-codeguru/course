# Dice Roller App (Flutter Basics Module)

A practical implementation of Flutter fundamentals through an interactive dice rolling application.

## What We Built

An interactive dice roller featuring:
- Animated 3D dice rotation with blur effects
- Custom-built dynamic dice faces (without image assets)
- Stateful widget management for UI updates
- Custom animations with AnimationController
- Gradient background and clean UI design

## Design Choices

### Custom Dice Face Implementation vs Image Assets
While the course demonstrated using image assets, we chose to implement a custom-built dice face system:

**Advantages of Our Custom Implementation:**
1. **Dynamic Rendering**: Programmatically generated dots based on dice value
2. **Better Scalability**: Perfect rendering at any size without pixelation
3. **Smaller App Size**: No need for multiple image assets
4. **More Control**: Easy to modify colors, sizes, and positions
5. **Learning Value**: Deeper understanding of Flutter's positioning system

**Technical Implementation:**
```dart
// Key components of our custom dice face:
- Dynamic dot positioning using Alignment system
- Stack widget for layered dot placement
- Custom dot styling with Container and BoxDecoration
- Reusable _buildDot method for consistent appearance
```

## Key Technical Implementations

### Core Concepts Learned
- **Widget Tree Structure**: 
  - MaterialApp → Scaffold → Container (gradient) → Column → Dice and Button
  - Understanding widget composition and nesting

- **State Management**:
  - Using StatefulWidget for dynamic UI updates
  - Managing animation states and dice values
  - Proper state disposal with dispose() method

- **Animation System**:
  ```dart
  // Key animation implementations:
  - AnimationController for rotation control
  - CurvedAnimation for smooth motion
  - Transform.rotate for 3D effect
  - BackdropFilter for blur effects during animation
  ```

- **Custom Widget Building**:
  - Dynamic dot positioning system
  - Reusable components (_buildDot, _buildDiceFace)
  - Custom styling and layout

### Code Organization
- Constants for consistent styling
- Separation of concerns (animation, UI, state management)
- Clean method organization within StatefulWidget
- Custom dot positioning system for dice faces

## Technical Stack
- Framework: Flutter
- Language: Dart
- State Management: Local state (setState)
- Animations: Custom AnimationController

## Key Learnings
1. **Flutter Basics**
   - Widget lifecycle management
   - Basic to advanced widget composition
   - Material Design implementation
   - Custom widget creation vs asset usage

2. **Dart Language Features**
   - Final and const usage
   - Class construction and inheritance
   - Async programming with Timer


3. **Best Practices**
   - Code organization
   - Widget tree optimization
   - Proper resource disposal
   - Smart tradeoffs between assets and custom implementations

## Running the Project
```bash
flutter pub get
flutter run
```

## Core Features Implemented
-  Random number generation (1-6)
-  Smooth rotation animation
-  Custom-built dice faces with programmatic dot positioning
-  Blur effects during animation
-  Responsive layout design

## Implementation Details
### Dice Face Generation
The dice faces are generated using a combination of:
- `Stack` widget for layout
- `Alignment` positioning for dots
- `Container` widgets with `BoxDecoration` for dots
- Switch statement for different dot patterns
- Reusable dot component for consistency
