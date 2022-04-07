import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:login_db/home.dart';
import 'package:login_db/login.dart';
import 'package:login_db/signup.dart';
import 'package:login_db/app_database.dart';
import 'package:login_db/db_operations.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      final db = await AppDatabase().initDB();

      DBOperations(db).users(email.text).then((value) => {
            if (value['length'] == 0)
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                )
              }
            else
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                )
              }
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: Text(
          'Welcome. Splash',
        ),
      ),
    );
  }
}
