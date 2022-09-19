class CarouselModel {
  CarouselModel({
    required this.id,
    required this.imagePath,
  });

  String id;
  String imagePath;

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        id: json["id"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "imagePath": imagePath,
      };
}
