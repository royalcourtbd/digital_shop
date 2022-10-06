class BdtProductsModel {
  BdtProductsModel({
    required this.id,
    required this.bdBankName,
    required this.bdBankIcon,
    required this.baBankAccountNumber,
  });

  String id;
  String bdBankName;
  String bdBankIcon;
  String baBankAccountNumber;

  factory BdtProductsModel.fromJson(Map<String, dynamic> json) =>
      BdtProductsModel(
        id: json["id"],
        bdBankName: json["bdBankName"],
        bdBankIcon: json["bdBankIcon"],
        baBankAccountNumber: json["baBankAccountNumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bdBankName": bdBankName,
        "bdBankIcon": bdBankIcon,
        "baBankAccountNumber": baBankAccountNumber,
      };
}
