import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditProfileController>(
      init: EditProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Edit Profile"),
          ),
          body: SingleChildScrollView(
            controller: ScrollController(),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const ExImagePicker(id: "photo", label: "Photo"),
                  const ExTextField(
                    id: "name",
                    label: "Name",
                    value: null,
                  ),
                  ExTextField(
                    id: "email",
                    label: "Email",
                    value: currentUser.email,
                    enabled: false,
                  ),
                  ExButton(
                    label: "Save",
                    color: Colors.blue[400],
                    onPressed: () => controller.doEdit(),
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
