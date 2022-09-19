import 'package:digital_shop/apps/exchangePage/controller/sell_history_controller.dart';
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
                  title: Text(
                    controller.sellOrderHistoryList.value[index].receiveMethod,
                  ),
                  leading: Text(
                    controller.sellOrderHistoryList.value[index].sendAmount,
                    textAlign: TextAlign.center,
                  ),
                  subtitle: Text(
                    controller.sellOrderHistoryList.value[index].dateTime,
                  ),
                  trailing: Text(
                    controller.sellOrderHistoryList.value[index].receiveAmount,
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
