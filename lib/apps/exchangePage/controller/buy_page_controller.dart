import 'package:digital_shop/apps/exchangePage/model/select_amount_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyPageController extends GetxController {
  var receiveAmount = '5'.obs;
  final buySelected = 'bKash'.obs;
  void setBuySelected(value) {
    buySelected.value = value;
  }

  final sellSelected = 'Bitcoin'.obs;
  void setSellSelected(value) {
    sellSelected.value = value;
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController sendAmountController = TextEditingController();
  TextEditingController receiveAmountController = TextEditingController();

  List<SelectAmountModel> selectItem = [
    SelectAmountModel(
      icon: 'assets/png_icon/007-user.png',
      dollarName: 'Amazon',
      amount: 2.2,
    ),
    SelectAmountModel(
      icon: 'assets/png_icon/cart.png',
      dollarName: 'Netflix',
      amount: 2.2,
    ),
    SelectAmountModel(
      icon: 'assets/png_icon/cart.png',
      dollarName: 'Chorki',
      amount: 2.2,
    ),
  ].obs;

  List buyMethodList = [
    'bKash',
    'Nagad',
    'Rocket',
    'Bank',
  ];
  List sellMethodList = [
    'Bitcoin',
    'Litecoin',
    'Coinbase BTC',
    'Neteller',
    'Skrill',
    'Tether',
    'Paypal',
    'Ethereum',
  ];
}
