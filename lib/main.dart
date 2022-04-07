import 'package:flutter/material.dart';
import 'package:login_db/home.dart';
import 'package:login_db/login.dart';
import 'package:login_db/signup.dart';
import 'package:login_db/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/signup': (context) => const SignupScreen(),
        '/signin': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
