import 'package:digital_shop/general/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_page_controller.dart';

class BodyView extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //TODO: implement build
    return Obx(
      () => ListView.builder(
        itemCount: controller.cartItemList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(controller.cartItemList[index].docId.toString());
            },
            onLongPress: () {
              controller.deleteItem(controller.cartItemList[index].docId);
            },
            child: Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) async {
                await controller
                    .deleteItem(controller.cartItemList[index].docId);
                controller.cartItemList.removeAt(index);
              },
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(
                    0xffffe6e6,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: const [
                    Spacer(),
                    Icon(Icons.delete),
                  ],
                ),
              ),
              child: Card(
                child: Container(
                  alignment: Alignment.center,
                  height: Config.screenHeight! * 0.12,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: Config.screenWidth! * 0.23,
                        child: Image.network(
                          controller.cartItemList[index].image,
                        ),
                      ),
                      const SizedBox(
                        width: 9,
                      ),
                      Expanded(
                        child: Container(
                          //width: 100,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  //color: Colors.red,
                                  width: Config.screenWidth! * 0.7,
                                  child: Text(
                                    controller.cartItemList[index].productName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontFamily: '',
                                      fontSize: 16,
                                      //fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // color: Colors.blue,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            controller.cartItemList[index]
                                                    .discountPrice +
                                                ' ৳',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black54,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          padding: const EdgeInsets.all(7),
                                          //alignment: Alignment.centerRight,
                                          //color: Colors.green,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  controller.decrement();
                                                },
                                                icon: const Icon(
                                                  Icons.remove_circle_outline,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              Obx(() => Text(
                                                    controller.quantity
                                                        .toString(),
                                                    style: const TextStyle(
                                                      color: Colors.black54,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  )),
                                              IconButton(
                                                onPressed: () {
                                                  controller
                                                      .cartItemList[index];
                                                  controller.increment();
                                                },
                                                icon: const Icon(
                                                  Icons.add_circle_outline,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   width: 7,
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
