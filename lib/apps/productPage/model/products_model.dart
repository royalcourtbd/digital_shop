class ProductModel {
  ProductModel({
    required this.id,
    required this.productName,
    required this.category,
    required this.price,
    required this.quantity,
    required this.discountPrice,
    required this.discription,
    this.highlights,
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
  String? highlights;
  String image;
  String? totalSell;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        productName: json["productName"],
        category: json["category"],
        price: json["price"],
        quantity: json["quantity"],
        discountPrice: json["discountPrice"],
        discription: json["discription"],
        highlights: json["highlights"],
        image: json["image"],
        totalSell: json["totalSell"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "category": category,
        "price": price,
        "quantity": quantity,
        "discountPrice": discountPrice,
        "discription": discription,
        "highlights": highlights,
        "image": image,
        "totalSell": totalSell,
      };
}


// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

// import 'dart:convert';

// ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

// String productModelToJson(ProductModel data) => json.encode(data.toJson());

// class ProductModel {
//     ProductModel({
//         required this.id,
//        required this.productName,
//        required this.category,
//       required  this.price,
//       required  this.quantity,
//       required  this.discountPrice,
//       required  this.discription,
//       required  this.image,
//         this.totalSell,
//     });

//     String id;
//     String productName;
//     String category;
//     double price;
//     int quantity;
//     double discountPrice;
//     String discription;
//     List<dynamic> image;
//     int? totalSell;

//     factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
//         id: json["id"],
//         productName: json["productName"],
//         category: json["category"],
//         price: json["price"].toDouble(),
//         quantity: json["quantity"],
//         discountPrice: json["discountPrice"].toDouble(),
//         discription: json["discription"],
//         image: List<dynamic>.from(json["image"].map((x) => x)),
//         totalSell: json["totalSell"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "productName": productName,
//         "category": category,
//         "price": price,
//         "quantity": quantity,
//         "discountPrice": discountPrice,
//         "discription": discription,
//         "image": List<dynamic>.from(image.map((x) => x)),
//         "totalSell": totalSell,
//     };
// }
