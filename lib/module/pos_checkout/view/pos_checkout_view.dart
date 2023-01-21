import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:get/get.dart';

class PosCheckoutView extends StatelessWidget {
  const PosCheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PosCheckoutController>(
      init: PosCheckoutController(),
      builder: (controller) {
        controller.view = this;

        return Scaffold(
          appBar: AppBar(
            title: const Text("Checkout"),
          ),
          body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        var item = controller.products[index];
                        var total = double.parse(item["qty"].toString()) *
                            double.parse(item["price"]);
                        return Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.0, color: Colors.grey[400]!))),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text("${item["product_name"]}"),
                              ),
                              Text("${item["qty"]} x Rp. ${item["price"]}"),
                              const SizedBox(
                                width: 20.0,
                              ),
                              SizedBox(
                                width: 60.0,
                                child: Text(
                                  "$total",
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      "Rp. ${controller.orderTotal}",
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const ExRadio(
                  id: "payment_method",
                  label: "Payment Method",
                  items: [
                    {
                      "label": "Gopay",
                      "value": "Gopay",
                    },
                    {
                      "label": "Cash",
                      "value": "Cash",
                    },
                    {
                      "label": "Ovo",
                      "value": "Ovo",
                    },
                    {
                      "label": "Credit Card",
                      "value": "Credit Card",
                    },
                    {
                      "label": "Bank Card",
                      "value": "Bank Card",
                    },
                  ],
                  value: "Female",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ExButton(
                  label: "Checkout",
                  color: primaryColor,
                  onPressed: () => controller.doCheckout(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
