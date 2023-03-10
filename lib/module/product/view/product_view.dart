import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Product"),
            actions: [
              InkWell(
                onTap: () => Get.to(const ProductFormView()),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                ExSearchField(
                  id: "search",
                  label: "Search",
                  onSubmitted: (text) {
                    controller.filterProductName = text;
                    controller.update();
                  },
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: userCollection.collection("products").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return const Text("Error");
                      if (snapshot.data == null) return Container();
                      if (snapshot.data!.docs.isEmpty) {
                        return const Text("No Data");
                      }
                      final data = snapshot.data!;
                      return ListView.builder(
                        itemCount: data.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> item =
                              (data.docs[index].data() as Map<String, dynamic>);
                          item["id"] = data.docs[index].id;

                          //-start filter

                          if (controller.filterProductName.isNotEmpty) {
                            var name =
                                item["product_name"].toString().toLowerCase();
                            var search =
                                controller.filterProductName.toLowerCase();

                            if (!name.contains(search)) {
                              return Container();
                            }
                          }

                          //end filter

                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: NetworkImage(
                                  item["photo"] ??
                                      "https://i.ibb.co/QrTHd59/woman.jpg",
                                ),
                              ),
                              title: Text("${item["product_name"]}"),
                              subtitle: Text(
                                ("Rp. ${item["price"]}"),
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
