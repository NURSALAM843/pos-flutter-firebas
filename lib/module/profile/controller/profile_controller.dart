import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileView? view;

  doLogout() async {
    await FirebaseAuth.instance.signOut();
    await Get.deleteAll();
    Get.offAll(const LoginView());
  }
}
