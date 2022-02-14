import 'package:flutter/material.dart';
import 'package:login_screen_task/screens/logged_in_screen.dart';
import 'package:login_screen_task/screens/login_screen.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'services/auth_service.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null
              ? LoginScereen()
              : LoggedInScreen(email: user.email.toString());
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
