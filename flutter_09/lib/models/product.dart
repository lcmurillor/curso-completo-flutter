import 'dart:convert';

class Product {
  Product(
      {required this.available,
      required this.name,
      required this.price,
      this.id,
      this.picture});

  bool available;
  double price;
  String name;
  String? id;
  String? picture;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        available: json["available"],
        name: json["name"],
        picture: json["picture"],
        price: json["price"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "available": available,
        "name": name,
        "picture": picture,
        "price": price,
      };

  Product copy() => Product(
      available: available, name: name, picture: picture, price: price, id: id);
}
