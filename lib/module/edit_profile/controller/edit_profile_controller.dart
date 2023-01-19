import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  EditProfileView? view;

  doEdit() async {
    var photo = Input.get("photo");
    var name = Input.get("name");

    await userCollection.update({
      "photo": photo,
      "name": name,
    });
    Get.back();
  }
}
