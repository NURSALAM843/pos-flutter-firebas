import 'package:flutter/material.dart';
import '../controller/profile_controller.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Profile"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: IconButton(
                    onPressed: () => controller.doLogout(),
                    icon: const Icon(Icons.logout_sharp)),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: const [],
              ),
            ),
          ),
        );
      },
    );
  }
}
