import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';
import '../view/product_form_view.dart';

class ProductFormController extends GetxController {
  ProductFormView? view;

  doSave() async {
    var photo = Input.get("photo");
    var productName = Input.get("product_name");
    var price = Input.get("price");
    var description = Input.get("description");

    await userCollection.collection("products").add({
      "photo": photo,
      "product_name": productName,
      "price": price,
      "description": description,
    });

    Get.back();
  }
}
