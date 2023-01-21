import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class PosView extends StatelessWidget {
  const PosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosController>(
      init: PosController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Pos"),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(20.0),
            child: ExButton(
              label: "Checkout",
              color: primaryColor,
              onPressed: () => Get.to(const PosCheckoutView()),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: controller.products.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var item = controller.products[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(
                        item["photo"] ??
                            "https://i.ibb.co/S32HNjD/no-image.jpg",
                      ),
                    ),
                    title: Text("${item["product_name"]}"),
                    subtitle: Text("\$Rp. ${item["price"]}"),
                    trailing: SizedBox(
                      width: 120.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 12.0,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  item["qty"] = item["qty"] ?? 0;
                                  if (item["qty"] == 0) return;
                                  item["qty"]--;
                                  controller.update();
                                },
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 9.0,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${item["qty"] ?? 0} ",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            radius: 12.0,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  item["qty"] = item["qty"] ?? 0;
                                  item["qty"]++;
                                  controller.update();
                                },
                                icon: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 9.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
