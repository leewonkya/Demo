import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:futter_login_api/app/routes/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  var responesText = ''.obs;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isShow = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Api'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  controller: emailController,
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: isShow,
                  decoration: InputDecoration(
                      labelText: 'Password', suffixIcon: Icon(Icons.lock)),
                  // suffixIcon: passwordCtr.passwordController.text.length > 0
                  //     ? IconButton(
                  //         onPressed: () => passwordCtr.passwordController.clear(),
                  //         icon: Icon(
                  //           Icons.cancel,
                  //           color: Colors.grey,
                  //         ),
                  //       )
                  //     : null),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton.icon(
                    onPressed: () {
                      login();
                    },
                    icon: Icon(Icons.login),
                    label: Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var url = "https://localhost:44330/api/auth/login";
      var response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            "email": emailController.text,
            "password": passwordController.text
          }));
      print(response);
      if (response.statusCode == 200) {
        Get.to(HomePage());
      }
    } else {
      Get.snackbar('Message', 'Đã xảy ra lỗi, vui lòng thử lại',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
