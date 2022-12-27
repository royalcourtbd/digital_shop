// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.userId,
    this.accountBalance,
    this.name,
    this.email,
    this.image,
    this.createdAt,
    this.deviceToken,
  });

  String? userId;
  int? accountBalance;
  String? name;
  String? email;
  String? image;
  String? createdAt;
  String? deviceToken;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        accountBalance: json["accountBalance"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        createdAt: json["createdAt"],
        deviceToken: json["deviceToken"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "accountBalance": accountBalance,
        "name": name,
        "email": email,
        "image": image,
        "createdAt": createdAt,
        "deviceToken": deviceToken,
      };
}
