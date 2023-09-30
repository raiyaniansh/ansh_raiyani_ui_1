import 'dart:convert';

HomeModal homeModalFromJson(String str) => HomeModal.fromJson(json.decode(str));

String homeModalToJson(HomeModal data) => json.encode(data.toJson());

class HomeModal {
  List<ProductDatum>? productData;

  HomeModal({
    this.productData,
  });

  factory HomeModal.fromJson(Map<String, dynamic> json) => HomeModal(
    productData: json["ProductData"] == null ? [] : List<ProductDatum>.from(json["ProductData"]!.map((x) => ProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "ProductData": productData == null ? [] : List<dynamic>.from(productData!.map((x) => x.toJson())),
  };
}

class ProductDatum {
  String? id;
  String? categoryName;
  String? name;
  String? price;
  String? image;
  String? averageRating;

  ProductDatum({
    this.id,
    this.categoryName,
    this.name,
    this.price,
    this.image,
    this.averageRating,
  });

  factory ProductDatum.fromJson(Map<String, dynamic> json) => ProductDatum(
    id: json["Id"],
    categoryName: json["CategoryName"],
    name: json["Name"],
    price: json["Price"],
    image: json["Image"],
    averageRating: json["AverageRating"],
  );

  Map<String, dynamic> toJson() => {
    "Id": id,
    "CategoryName": categoryName,
    "Name": name,
    "Price": price,
    "Image": image,
    "AverageRating": averageRating,
  };
}
