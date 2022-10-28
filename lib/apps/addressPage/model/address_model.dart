// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

AddressModel addressModelFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

String addressModelToJson(AddressModel data) => json.encode(data.toJson());

class AddressModel {
  AddressModel({
    this.docId,
    this.userId,
    this.addressId,
    this.name,
    this.number,
    this.address,
    this.division,
    this.thana,
    this.zip,
    this.label,
    this.createdAt,
  });

  String? docId;
  String? userId;
  String? addressId;
  String? name;
  String? number;
  String? address;
  String? division;
  String? thana;
  String? zip;
  String? label;
  String? createdAt;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        docId: json["docId"],
        userId: json["userId"],
        addressId: json["addressId"],
        name: json["name"],
        number: json["number"],
        address: json["address"],
        division: json["division"],
        thana: json["thana"],
        zip: json["zip"],
        label: json["label"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "userId": userId,
        "addressId": addressId,
        "name": name,
        "number": number,
        "address": address,
        "division": division,
        "thana": thana,
        "zip": zip,
        "label": label,
        "createdAt": createdAt,
      };
}
