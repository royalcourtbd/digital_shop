class CartModel {
  CartModel({
    this.docId,
    this.cartId,
    this.userId,
    this.productId,
    this.image,
    this.productName,
    this.price,
    this.discountPrice,
    this.quantity = 1,
    this.productTotalPrice,
    this.createdAt,
  });

  String? docId;
  String? cartId;
  String? userId;
  String? productId;
  String? image;
  String? productName;
  double? price;
  double? discountPrice;
  int? quantity;
  double? productTotalPrice;
  String? createdAt;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel( 
        docId: json["docId"],
        cartId: json["cartId"],
        userId: json["userId"],
        productId: json["productId"],
        image: json["image"],
        productName: json["productName"],
        price: json["price"],
        discountPrice: json["discountPrice"],
        quantity: json["quantity"],
        productTotalPrice: json["productTotalPrice"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "docId": docId,
        "cartId": cartId,
        "userId": userId,
        "productId": productId,
        "image": image,
        "productName": productName,
        "price": price,
        "discountPrice": discountPrice,
        "quantity": quantity,
        "productTotalPrice": productTotalPrice,
        "createdAt": createdAt,
      };
}
