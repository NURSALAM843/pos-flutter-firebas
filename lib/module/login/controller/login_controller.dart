import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';
import '../view/login_view.dart';

class LoginController extends GetxController {
  LoginView? view;

  doLogin() async {
    var email = Input.get("email");
    var password = Input.get("password");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(const MainNavigationView());
    } on Exception catch (_) {
      Get.snackbar("Error", "Email dan Password Not Matched");
    }
  }
}
