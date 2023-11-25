import 'package:flutter/material.dart';
import 'package:screl_machine_test/utils/theme_constants.dart';

import 'features/home/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management',
      theme: ThemeConstants.themeData,
      home: const HomeScreen(),
    );
  }
}
