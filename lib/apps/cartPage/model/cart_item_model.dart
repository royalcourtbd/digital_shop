// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.docId,
    this.cartId,
    this.userId,
    this.productId,
    this.image,
    this.productName,
    this.price,
    this.discountPrice,
    this.quantity,
    this.productTotalPrice,
    this.createdAt,
  });

  String? docId;
  String? cartId;
  String? userId;
  String? productId;
  String? image;
  String? productName;
  String? price;
  String? discountPrice;
  String? quantity;
  String? productTotalPrice;
  String? createdAt;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        docId: json["docId"],
        cartId: json["cartId"],
        userId: json["userId"],
        productId: json["productId"],
        image: json["image"],
        productName: json["productName"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        quantity: json["quantity"],
        productTotalPrice: json["productTotalPrice"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "cartId": cartId,
        "userId": userId,
        "productId": productId,
        "image": image,
        "productName": productName,
        "price": price,
        "discountPrice": discountPrice,
        "quantity": quantity,
        "productTotalPrice": productTotalPrice,
        "createdAt": createdAt,
      };
}
