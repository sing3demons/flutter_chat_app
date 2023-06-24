import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Screens/HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primaryColor: const Color(0xFF075E54),
        secondaryHeaderColor: Color(0xFF128C7E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF128C7E),
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
