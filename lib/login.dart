import 'package:flutter/material.dart';
import 'package:login_db/app_database.dart';
import 'package:login_db/db_operations.dart';
import 'package:login_db/home.dart';
import 'package:login_db/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome. Login',
            ),
            SizedBox(
              child: TextFormField(
                controller: email,
              ),
              width: 300,
            ),
            SizedBox(
              child: TextFormField(
                obscuringCharacter: "*",
                obscureText: true,
                controller: password,
              ),
              width: 300,
            ),
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    final db = await AppDatabase().initDB();

                    DBOperations(db).users(email.text).then((value) => {
                          if (value['length'] == 0)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignupScreen()),
                              )
                            }
                          else
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()),
                              )
                            }
                        });
                  },
                  child: const Text('Login'),
                ),
              ),
            ),
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupScreen()),
                    );
                  },
                  child: const Text('Sign Up'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
