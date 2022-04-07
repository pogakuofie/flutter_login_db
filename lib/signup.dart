import 'package:flutter/material.dart';
import 'package:login_db/app_database.dart';
import 'package:login_db/db_operations.dart';
import 'package:login_db/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password1 = TextEditingController();
  final password2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              child: Text(
                'Welcome. Signup',
              ),
              height: 200,
            ),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Fullname',
              ),
              SizedBox(
                child: TextFormField(
                  controller: fullname,
                ),
                width: 300,
              ),
              const Text(
                'Email',
              ),
              SizedBox(
                child: TextFormField(
                  controller: email,
                ),
                width: 300,
              ),
              const Text(
                'Password',
              ),
              SizedBox(
                child: TextFormField(
                  controller: password1,
                  obscureText: true,
                ),
                width: 300,
              ),
              const Text(
                'Confirm Password',
              ),
              SizedBox(
                child: TextFormField(
                  controller: password2,
                  obscureText: true,
                ),
                width: 300,
              ),
              Center(
                child: SizedBox(
                  child: ElevatedButton(
                    onPressed: () async {
                      final db = await AppDatabase().initDB();
                      DBOperations(db).insertRecord(
                          fullname.text, email.text, password2.text);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    },
                    child: const Text('Sign up'),
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
