import 'package:flutter/material.dart';
import '../controller/favorite_controller.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoriteController>(
      init: FavoriteController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Favorite"),
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