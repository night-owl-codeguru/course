import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './screens/places.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Great Places',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 102, 6, 247),
          brightness: Brightness.dark,
          background: const Color.fromARGB(255, 56, 49, 66),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 56, 49, 66),
      ),
      home: const PlacesScreen(),
    );
  }
}
