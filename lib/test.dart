import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'apps/exchangePage/model/received_usd_model.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  static const Received_USD = 'received_USD';
  List<ReceivedUsdModel> itemList = [];
  @override
  void initState() {
    // TODO: implement initState

    getUsdPriceList();
    super.initState();
  }

  getUsdPriceList() async {
    var response =
        await FirebaseFirestore.instance.collection(Received_USD).get();
    dataRecords(response);
  }

  dataRecords(QuerySnapshot<Map<String, dynamic>> response) {
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
      itemList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Column(
        children: [
          // StreamBuilder(
          //   stream:
          //       FirebaseFirestore.instance.collection(Received_USD).snapshots(),
          //   builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
          //     return ListView.builder(
          //       itemCount: snapshot.data.docs.length,
          //       itemBuilder: (context, index) {
          //         return const ListTile();
          //       },
          //     );
          //     // return ListTile(
          //     //   leading: Image.network(itemList..dollarIcon),
          //     //   title: Text(itemList[index].dollarName),
          //     //   subtitle: Text(itemList[index].dollarIcon),
          //     // );
          //   },
          // ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(itemList[index].dollarIcon),
                title: Text(itemList[index].dollarName),
                subtitle: Text(itemList[index].dollarIcon),
              );
            },
          ),
        ],
      ),
    );
  }
}
