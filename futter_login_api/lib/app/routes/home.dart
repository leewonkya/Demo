import 'package:flutter/material.dart';
import 'package:futter_login_api/app/routes/login.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: OutlinedButton.icon(
              onPressed: () => Get.to(LoginPage()),
              icon: Icon(Icons.logout_sharp),
              label: Text('Log out')),
        ),
      ),
    );
  }
}
