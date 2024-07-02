import 'package:best_courses/constants/fonts.dart';
import 'package:best_courses/languages/ar.dart';
import 'package:best_courses/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Ar.appName,
      home: const SplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        fontFamily: cairo,
        useMaterial3: true,
      ),
    );
  }
}
