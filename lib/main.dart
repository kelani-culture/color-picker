import 'package:color_picker/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xFF2a3d66),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(primary: const Color(0xFF2a3d66)),
          appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF7cb855), elevation: 0)),
      home: const HomePage(),
    );
  }
}
