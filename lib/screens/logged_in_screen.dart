// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login_screen_task/services/auth_service.dart';
import 'package:login_screen_task/widgets/ListTile.dart';
import 'package:provider/provider.dart';

class LoggedInScreen extends StatefulWidget {
  final String email;
  const LoggedInScreen({Key? key, required this.email}) : super(key: key);

  @override
  _LoggedInScreenState createState() => _LoggedInScreenState();
}

class _LoggedInScreenState extends State<LoggedInScreen> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.indigo.shade900,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Avatar",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: LikeListTile(),
          ),
          SizedBox(
            height: 50,
          ),
          const TextField(
            enabled: false,
            keyboardType: TextInputType.emailAddress,
            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              hintText: "daniel@test.com",
              prefixIcon: Icon(
                Icons.mail,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          const TextField(
            enabled: false,
            obscureText: true,
            // keyboardType: TextInputType.emailAddress,

            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              hintText: "*********",
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: 300,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 32.0),
              child: Container(
                width: 140,
                child: RawMaterialButton(
                  fillColor: Colors.blue[500],
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: () async {
                    authService.signOut();
                  },
                  child: const Text(
                    "Log out",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
