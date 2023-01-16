import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';
import '../view/register_view.dart';

class RegisterController extends GetxController {
  RegisterView? view;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  doRegister() async {
    var email = Input.get("email");
    var password = Input.get("password");

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(const MainNavigationView());
    } on Exception catch (_) {
      Get.snackbar("Error", "Your Request Failed");
    }
  }
}
