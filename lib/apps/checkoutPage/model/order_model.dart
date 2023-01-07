// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.docId,
    this.orderId,
    this.uid,
    this.orderDate,
    this.orderStatus,
    this.paymentMethod,
    this.deliveryCharge,
    this.discount,
    this.grandTotal,
    this.deliveryAddress,
  });

  String? docId;
  String? orderId;
  String? uid;
  String? orderDate;
  String? orderStatus;
  String? paymentMethod;
  double? deliveryCharge;
  double? discount;
  double? grandTotal;
  String? deliveryAddress;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        docId: json["docId"],
        orderId: json["orderId"],
        uid: json["uid"],
        orderDate: json["orderDate"],
        orderStatus: json["orderStatus"],
        paymentMethod: json["paymentMethod"],
        deliveryCharge: json["deliveryCharge"],
        discount: json["discount"],
        grandTotal: json["grandTotal"],
        deliveryAddress: json["deliveryAddress"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "orderId": orderId,
        "uid": uid,
        "orderDate": orderDate,
        "orderStatus": orderStatus,
        "paymentMethod": paymentMethod,
        "deliveryCharge": deliveryCharge,
        "discount": discount,
        "grandTotal": grandTotal,
        "deliveryAddress": deliveryAddress,
      };
}
