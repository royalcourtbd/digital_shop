class SellOrderModel {
  SellOrderModel({
    required this.contactNumber,
    required this.email,
    required this.note,
    required this.receiveAmount,
    required this.receiveMethod,
    required this.sendMethod,
    required this.sendNumber,
    required this.sendAmount,
    required this.dateTime,
  });

  String contactNumber;
  String email;
  String note;
  String receiveAmount;
  String receiveMethod;
  String sendMethod;
  String sendNumber;
  String sendAmount;
  String dateTime;

  factory SellOrderModel.fromJson(Map<String, dynamic> json) => SellOrderModel(
        contactNumber: json["contactNumber"],
        email: json["email"],
        note: json["note"],
        receiveAmount: json["receiveAmount"],
        receiveMethod: json["receiveMethod"],
        sendMethod: json["sendMethod"],
        sendNumber: json["sendNumber"],
        sendAmount: json["sendAmount"],
        dateTime: json["dateTime"],
      );

  Map<String, dynamic> toJson() => {
        "contactNumber": contactNumber,
        "email": email,
        "note": note,
        "receiveAmount": receiveAmount,
        "receiveMethod": receiveMethod,
        "sendMethod": sendMethod,
        "sendNumber": sendNumber,
        "sendAmount": sendAmount,
        "dateTime": dateTime,
      };
}
