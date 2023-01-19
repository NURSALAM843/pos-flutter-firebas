import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () => Get.to(const EditProfileView()),
                    icon: const Icon(Icons.edit)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () => controller.doLogout(),
                    icon: const Icon(Icons.logout_sharp)),
              ),
            ],
          ),
          body: StreamBuilder<DocumentSnapshot<Object?>>(
            stream: userCollection.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) return const Text("Error");
              if (!snapshot.hasData) return const Text("No Data");
              Map<String, dynamic> item =
                  (snapshot.data!.data() as Map<String, dynamic>);
              item["id"] = snapshot.data!.id;
              return Container(
                width: Get.width,
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: Get.width / 6,
                      backgroundColor: const Color.fromARGB(255, 233, 211, 211),
                      backgroundImage: NetworkImage(item["photo"] ??
                          "https://i.ibb.co/S32HNjD/no-image.jpg"),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "${item["name"]}",
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "${item["email"]}",
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
