import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:login_screen_task/models/user.dart';
import 'package:login_screen_task/screens/logged_in_screen.dart';
import 'package:login_screen_task/screens/not_logged_in.dart';
import 'package:login_screen_task/services/auth_service.dart';

import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  // login function
  List<User> _users = <User>[];

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: "User Email",
                  prefixIcon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 26.0,
              ),
              TextField(
                obscureText: true,
                // keyboardType: TextInputType.emailAddress,
                controller: _passwordController,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: "User Password",
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.blue[500],
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () async {
                    authService.createUserWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
