# Module 7: Flutter & Dart Internals - TODO App

A practical implementation exploring Flutter's internal workings through a Todo application.

## What We Learned

### Core Concepts
- **Three Tree Architecture**
  - Widget Tree (Configuration)
  - Element Tree (Holds State)
  - Render Tree (Handles Layout/Painting)

- **UI Update Cycle**
  - Understanding Widget rebuilding
  - Element reconciliation
  - Render object updates

- **Performance Optimization**
  - Widget extraction for targeted rebuilds
  - Proper use of const constructors
  - Strategic widget refactoring

### Key Implementation Features
- **Todo Management**
  - Add/Remove todos with unique IDs
  - Swipe-to-delete functionality
  - Flexible sorting system:
    - Sort by name or creation date
    - Toggle ascending/descending order
    - Visual indicators for sort type and direction
  - Timestamp tracking for todos

- **State Management**
  - Local state handling with StatefulWidget
  - Efficient UI updates using setState
  - Enum-based sort type management
  - Dynamic list sorting with multiple criteria

### Technical Implementation Details
- **Core Components**:
  - Todo data model with UUID and timestamp
  - Stateful TodoScreen widget
  - Reusable TodoList and TodoItem widgets
  - Advanced sorting UI in AppBar:
    - PopupMenuButton for sort type selection
    - IconButton for sort direction
  - Dismissible items with swipe-to-delete

- **Sorting Implementation**:
  - Dual-criteria sorting (name/date)
  - Toggle between ascending/descending
  - Dynamic sort type switching
  - Automatic sorting on:
    - New todo addition
    - Sort type change
    - Direction toggle

### Dart Language Features
- Understanding `var` vs `final` vs `const`
- Enum usage for type-safe options
- String and DateTime comparison
- Memory optimization techniques
- Proper state management patterns

## Key Widgets Used
- MaterialApp
- Scaffold with AppBar actions
- PopupMenuButton for sort options
- ListView.builder
- Dismissible
- TextField
- ListTile with subtitle
- Row and Column for layouts
- IconButton and Icon with dynamic icons
