import 'package:digital_shop/apps/exchangePage/controller/sell_history_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SellHistoryPageView extends GetView<SellHistoryController> {
  const SellHistoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
        centerTitle: true,
      ),
      // drawer: const DrawerForExchangePage(),
      body: GetX(
        init: SellHistoryController(),
        builder: <SellHistoryController>(controller) {
          return ListView.builder(
            itemCount: controller.sellOrderHistoryList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    if (kDebugMode) {
                      print(index.toString());
                    }
                  },
                  title: Text(
                    controller.sellOrderHistoryList.value[index].sendMethod +
                        "To " +
                        controller
                            .sellOrderHistoryList.value[index].receiveMethod,
                  ),
                  leading: Container(
                    width: 50,
                    alignment: Alignment.center,
                    child: Text(
                      (int.parse(index.toString()) + 1).toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  subtitle: Text(
                      '${controller.sellOrderHistoryList.value[index].sendAmount}\$ To '
                      "${controller.sellOrderHistoryList.value[index].receiveAmount} tk"),
                  trailing: const Text(
                    'Pending',
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
