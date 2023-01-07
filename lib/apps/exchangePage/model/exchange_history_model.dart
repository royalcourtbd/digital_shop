import 'dart:convert';

ExchangeHistoryModel exchangeHistoryModelFromJson(String str) =>
    ExchangeHistoryModel.fromJson(json.decode(str));

String exchangeHistoryModelToJson(ExchangeHistoryModel data) =>
    json.encode(data.toJson());

class ExchangeHistoryModel {
  ExchangeHistoryModel({
    this.docId,
    this.sendMethod,
    this.receivedMethod,
    this.trxId,
    this.sendMethodIcon,
    this.receivedMethodIcon,
    this.sendAmount,
    this.receivedAmount,
    this.contactNumber,
    this.status,
    this.createdAt,
  });

  String? docId;
  String? sendMethod;
  String? receivedMethod;
  String? trxId;
  String? sendMethodIcon;
  String? receivedMethodIcon;
  String? sendAmount;
  String? receivedAmount;
  String? contactNumber;
  bool? status;
  String? createdAt;

  factory ExchangeHistoryModel.fromJson(Map<String, dynamic> json) =>
      ExchangeHistoryModel(
        docId: json["docId"],
        sendMethod: json["sendMethod"],
        receivedMethod: json["receivedMethod"],
        trxId: json["trxId"],
        sendMethodIcon: json["sendMethodIcon"],
        receivedMethodIcon: json["receivedMethodIcon"],
        sendAmount: json["sendAmount"],
        receivedAmount: json["receivedAmount"],
        contactNumber: json["contactNumber"],
        status: json["status"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "sendMethod": sendMethod,
        "receivedMethod": receivedMethod,
        "trxId": trxId,
        "sendMethodIcon": sendMethodIcon,
        "receivedMethodIcon": receivedMethodIcon,
        "sendAmount": sendAmount,
        "receivedAmount": receivedAmount,
        "contactNumber": contactNumber,
        "status": status,
        "createdAt": createdAt,
      };
}
