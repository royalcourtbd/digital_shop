import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WalletPageView extends StatefulWidget {
  const WalletPageView({Key? key}) : super(key: key);

  @override
  State<WalletPageView> createState() => _WalletPageViewState();
}

class _WalletPageViewState extends State<WalletPageView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/DS_Logo.png',
          height: 45,
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: TabController(length: 3, vsync: this),
          tabs: const [
            Tab(
              text: "bKash",
            ),
            Tab(
              text: "Nagad",
            ),
            Tab(
              text: "Rocket",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // TextFieldForSell(
            //   textInputType: TextInputType.number,
            //   hintText: '20',
            //   textEditingController: TextEditingController(),
            //   inputFormatters: const [
            //     //FilteringTextInputFormatter.digitsOnly,
            //   ],
            //   validator: (value) {
            //     return null;

            //     //return controller.validateSendAmountNumber(value!);
            //   },
            //   maxLength: 5,
            // ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                ),
              ),
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  hintText: 'Enter Your Amount minimum 20৳',
                  counterText: '',
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                maxLength: 5,
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
