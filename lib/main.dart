import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/home_screen.dart';

import 'package:flutter_chat_app/screens/camera_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  debugPrint(cameras.first.toString());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF075E54),
        secondaryHeaderColor: const Color(0xFF128C7E),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF128C7E),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
