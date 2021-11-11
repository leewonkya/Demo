import 'package:futter_login_api/app/routes/home.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Future<void> login(RxString email, RxString password) async {
  if (email.isNotEmpty && password.isNotEmpty) {
    var response = await http.post(
        Uri.parse("https://localhost:44330/api/auth/login"),
        body: ({'email': email, 'password': password}));

    print(response);
    if (response.statusCode == 200) {
      Get.to(HomePage());
    }
  } else {
    Get.snackbar('Message', 'Đã xảy ra lỗi, vui lòng thử lại',
        snackPosition: SnackPosition.BOTTOM);
  }
}
