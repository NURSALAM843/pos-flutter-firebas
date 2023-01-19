import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Dashboard"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  height: 140.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1533050487297-09b450131914?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        16.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Wrap(
                  children: [
                    InkWell(
                      onTap: () => Get.to(const ProductView()),
                      child: SizedBox(
                        width: (Get.width - 40) / 4,
                        child: Column(
                          children: const [
                            Icon(
                              Icons.food_bank,
                              color: Colors.deepPurple,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Product",
                              style: TextStyle(color: Colors.deepPurple),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(const OrderView()),
                      child: SizedBox(
                        width: (Get.width - 40) / 4,
                        child: Column(
                          children: const [
                            Icon(
                              Icons.list_alt,
                              color: Colors.deepOrangeAccent,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text("Order",
                                style:
                                    TextStyle(color: Colors.deepOrangeAccent)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.to(const PosView()),
                      child: SizedBox(
                        width: (Get.width - 40) / 4,
                        child: Column(
                          children: const [
                            Icon(
                              Icons.point_of_sale,
                              color: Color.fromARGB(255, 131, 235, 136),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "POS",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 131, 235, 136)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
