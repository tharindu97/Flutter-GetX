import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/controllers/cart_controller.dart';
import 'package:statemanagement/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  ShoppingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.products[index].productName,
                                        style: const TextStyle(fontSize: 24),
                                      ),
                                      Text(controller
                                          .products[index].productDescription),
                                    ],
                                  ),
                                  Text('\$${controller.products[index].price}',
                                      style: const TextStyle(fontSize: 24)),
                                ],
                              ),
                              RaisedButton(
                                onPressed: () {
                                  cartController
                                      .addToCart(controller.products[index]);
                                },
                                color: Colors.blue,
                                textColor: Colors.white,
                                child: const Text('Add to Cart'),
                              ),
                              Obx(
                                () => IconButton(
                                  icon: controller
                                          .products[index].isFavorite.value
                                      ? const Icon(Icons.check_box_rounded)
                                      : const Icon(Icons
                                          .check_box_outline_blank_outlined),
                                  onPressed: () {
                                    controller.products[index].isFavorite
                                        .toggle();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                'Total amount: \$ ${controller.totalPrice}',
                style: const TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            const SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: const Icon(
          Icons.add_shopping_cart_rounded,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: const TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
      ),
    );
  }
}


// 1. GetBuilder -> variable .obs
// 2. GetX -> not variable .obs but update() manual state.
// 3. Obx
// obx((){
// retun Conatiner();
// })