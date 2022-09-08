// To parse this JSON data, do
//
//     final bdtProductsModel = bdtProductsModelFromJson(jsonString);

import 'dart:convert';

BdtProductsModel bdtProductsModelFromJson(String str) =>
    BdtProductsModel.fromJson(json.decode(str));

String bdtProductsModelToJson(BdtProductsModel data) =>
    json.encode(data.toJson());

class BdtProductsModel {
  BdtProductsModel({
    required this.id,
    required this.bdBankName,
    required this.bdBankIcon,
  });

  String id;
  String bdBankName;
  String bdBankIcon;

  factory BdtProductsModel.fromJson(Map<String, dynamic> json) =>
      BdtProductsModel(
        id: json["id"],
        bdBankName: json["bdBankName"],
        bdBankIcon: json["bdBankIcon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bdBankName": bdBankName,
        "bdBankIcon": bdBankIcon,
      };
}
