import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class OrderView extends StatelessWidget {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      init: OrderController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Order"),
          ),
          body: StreamBuilder<QuerySnapshot>(
            stream: userCollection.collection("orders").snapshots(),
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
                  return Card(
                    child: ListTile(
                      title: Text("${item["id"]}"),
                      subtitle: Text("${item["payment_method"]}"),
                      trailing: Text("${item["total"] ?? 0} "),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
