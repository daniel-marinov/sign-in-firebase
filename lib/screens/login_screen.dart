import 'package:flutter/material.dart';
import 'package:login_screen_task/models/user.dart';
import 'package:login_screen_task/screens/logged_in_screen.dart';
import 'package:login_screen_task/screens/not_logged_in.dart';
import 'package:login_screen_task/screens/register_screen.dart';
import 'package:login_screen_task/services/auth_service.dart';

import 'package:provider/provider.dart';

class LoginScereen extends StatefulWidget {
  const LoginScereen({Key? key}) : super(key: key);

  @override
  _LoginScereenState createState() => _LoginScereenState();
}

class _LoginScereenState extends State<LoginScereen> {
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
                  "Welcome",
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
                  hintText: "e.g johndoe@gmail.com",
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
                  hintText: "enter password",
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
                    authService.signInWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
                  },
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor: Colors.transparent,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotLoggedScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "Explore the app",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
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
