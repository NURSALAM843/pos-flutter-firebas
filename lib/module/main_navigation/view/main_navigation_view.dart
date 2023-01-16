import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class MainNavigationView extends StatelessWidget {
  const MainNavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavigationController>(
      init: MainNavigationController(),
      builder: (controller) {
        controller.view = this;

        return ExNavigation(children: const [
          DashboardView(),
          FavoriteView(),
          ProfileView()
        ], menus: [
          NavigationItem(icon: Icons.dashboard, label: "Dashbord"),
          NavigationItem(icon: Icons.favorite, label: "Favorite"),
          NavigationItem(icon: Icons.person, label: "Profile"),
        ]);
      },
    );
  }
}
