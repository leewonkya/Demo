import 'package:flutter/material.dart';
import 'package:futter_login_api/app/routes/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class State extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isShow = true;
}

class LoginPage extends StatelessWidget {
  final State Temp = Get.find();

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
                EmailBox(),
                SizedBox(
                  height: 15,
                ),
                PasswordBox(),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton.icon(
                    onPressed: () {},
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
    if (Temp.emailController.value == '' && Temp.passwordController == '') {
      var response = await http.post(
          Uri.parse("https://localhost:44330/api/auth/login"),
          body: ({
            'email': Temp.emailController.value,
            'password': Temp.passwordController.value
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

class EmailBox extends StatelessWidget {
  final emailCtr = Get.put(State());
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: emailCtr.emailController,
      decoration:
          InputDecoration(labelText: 'Email', suffixIcon: Icon(Icons.email)),
    );
  }
}

class PasswordBox extends StatelessWidget {
  final passwordCtr = Get.put(State());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: passwordCtr.passwordController,
      obscureText: passwordCtr.isShow,
      decoration:
          InputDecoration(labelText: 'Password', suffixIcon: Icon(Icons.lock)),
      // suffixIcon: passwordCtr.passwordController.text.length > 0
      //     ? IconButton(
      //         onPressed: () => passwordCtr.passwordController.clear(),
      //         icon: Icon(
      //           Icons.cancel,
      //           color: Colors.grey,
      //         ),
      //       )
      //     : null),
    );
  }
}
