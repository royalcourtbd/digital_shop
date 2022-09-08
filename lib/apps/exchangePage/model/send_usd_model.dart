// To parse this JSON data, do
//
//     final sendUsdModel = sendUsdModelFromJson(jsonString);

import 'dart:convert';

SendUsdModel sendUsdModelFromJson(String str) =>
    SendUsdModel.fromJson(json.decode(str));

String sendUsdModelToJson(SendUsdModel data) => json.encode(data.toJson());

class SendUsdModel {
  SendUsdModel({
    required this.id,
    required this.dollarName,
    required this.dollarIcon,
    required this.currentPrice,
  });

  String id;
  String dollarName;
  String dollarIcon;
  String currentPrice;

  factory SendUsdModel.fromJson(Map<String, dynamic> json) => SendUsdModel(
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
