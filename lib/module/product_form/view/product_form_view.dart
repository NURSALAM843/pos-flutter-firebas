import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class ProductFormView extends StatelessWidget {
  const ProductFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductFormController>(
      init: ProductFormController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Product Form"),
            actions: [
              InkWell(
                onTap: () => controller.doSave(),
                child: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Icon(Icons.save),
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [
                  ExImagePicker(
                    id: "photo",
                    label: "Photo",
                  ),
                  ExTextField(
                    id: "product_name",
                    label: "Product Name",
                    value: null,
                  ),
                  ExTextField(
                    id: "price",
                    label: "Price",
                    keyboardType: TextInputType.number,
                    value: "0",
                  ),
                  ExTextArea(
                    id: "description",
                    label: "Description",
                    value: null,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
