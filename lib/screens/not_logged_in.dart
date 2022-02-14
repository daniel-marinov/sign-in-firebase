import 'package:flutter/material.dart';
import 'package:login_screen_task/screens/logged_in_screen.dart';
import 'package:login_screen_task/screens/login_screen.dart';

class NotLoggedScreen extends StatelessWidget {
  const NotLoggedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: Colors.indigo.shade900,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "You are not logged in",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 44,
              ),
              const TextField(
                enabled: false,
                keyboardType: TextInputType.emailAddress,
                // ignore: prefer_const_constructors
                decoration: InputDecoration(
                  hintText: "User Email",
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
                  hintText: "User Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 380,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 140,
                  child: RawMaterialButton(
                    fillColor: Colors.blue[500],
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () async {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScereen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
