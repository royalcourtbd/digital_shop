class FavoriteDealModel {
  FavoriteDealModel({
    required this.id,
    required this.productName,
    required this.category,
    required this.price,
    required this.quantity,
    required this.discountPrice,
    required this.discription,
    required this.image,
    this.totalSell,
  });

  String id;
  String productName;
  String category;
  String price;
  String quantity;
  String discountPrice;
  String discription;
  String image;
  String? totalSell;

  factory FavoriteDealModel.fromJson(Map<String, dynamic> json) =>
      FavoriteDealModel(
        id: json["id"],
        productName: json["productName"],
        category: json["category"],
        price: json["price"],
        quantity: json["quantity"],
        discountPrice: json["discountPrice"],
        discription: json["discription"],
        image: json["image"],
        totalSell: json["total_sell"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "category": category,
        "price": price,
        "quantity": quantity,
        "discountPrice": discountPrice,
        "discription": discription,
        "image": image,
        "totalSell": totalSell,
      };
}
