// import 'package:digital_shop/apps/cartPage/controller/cart_page_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../general/utils/config.dart';

// class CartPageView extends GetView<CartPageController> {
//   const CartPageView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     Config().init(context);
//     return const Scaffold(
//       backgroundColor: Colors.cyanAccent,
//       body: Center(
//         child: Text('Cart Page'),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../exchangePage/model/received_usd_model.dart';

class CartPageView extends StatefulWidget {
  const CartPageView({Key? key}) : super(key: key);

  @override
  State<CartPageView> createState() => _CartPageViewState();
}

class _CartPageViewState extends State<CartPageView> {
  static const receivedUsdCollection = 'received_USD';
  List<ReceivedUsdModel> buyItemUSDList = [];

  @override
  void initState() {
    super.initState();
    getUsdPriceList();
    dataSnapshotsForUSD();
  }

  getUsdPriceList() async {
    var response = await FirebaseFirestore.instance
        .collection(receivedUsdCollection)
        .get();
    dataRecordsMapForUSD(response);
  }

  dataRecordsMapForUSD(QuerySnapshot<Map<String, dynamic>> response) {
    var list = response.docs
        .map(
          (e) => ReceivedUsdModel(
            id: e.id,
            dollarName: e['dollarName'],
            dollarIcon: e['dollarIcon'],
            currentPrice: e['currentPrice'],
          ),
        )
        .toList();
    setState(() {
      buyItemUSDList = list;
    });
  }

  dataSnapshotsForUSD() {
    FirebaseFirestore.instance
        .collection(receivedUsdCollection)
        .snapshots()
        .listen((response) {
      dataRecordsMapForUSD(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: buyItemUSDList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  buyItemUSDList[index].dollarName,
                ),
                leading: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      //color: Colors.redAccent,
                      ),
                  child: Image.network(
                    buyItemUSDList[index].dollarIcon,
                  ),
                ),
                trailing: Text(
                  buyItemUSDList[index].currentPrice,
                ),
              );
            },
          ),
          // ListView.builder(
          //   itemCount: buyItemUSDList.length,
          //   itemBuilder: (context, index) {
          //     return ListTile(
          //       title: Text(
          //         buyItemUSDList[index].dollarName,
          //       ),
          //       leading: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: const BoxDecoration(
          //             //color: Colors.redAccent,
          //             ),
          //         child: Image.network(
          //           buyItemUSDList[index].dollarIcon,
          //         ),
          //       ),
          //       trailing: Text(
          //         buyItemUSDList[index].currentPrice,
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
