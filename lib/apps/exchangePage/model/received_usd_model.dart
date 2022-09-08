// To parse this JSON data, do
//
//     final receivedUsdModel = receivedUsdModelFromJson(jsonString);

import 'dart:convert';

ReceivedUsdModel receivedUsdModelFromJson(String str) =>
    ReceivedUsdModel.fromJson(json.decode(str));

String receivedUsdModelToJson(ReceivedUsdModel data) =>
    json.encode(data.toJson());

class ReceivedUsdModel {
  ReceivedUsdModel({
    required this.id,
    required this.dollarName,
    required this.dollarIcon,
    required this.currentPrice,
  });

  String id;
  String dollarName;
  String dollarIcon;
  String currentPrice;

  factory ReceivedUsdModel.fromJson(Map<String, dynamic> json) =>
      ReceivedUsdModel(
        id: json["id"],
        dollarName: json["dollarName"],
        dollarIcon: json["dollarIcon"],
        currentPrice: json["currentPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dollarName": dollarName,
        "dollarIcon": dollarIcon,
        "currentPrice": currentPrice,
      };
}
