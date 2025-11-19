import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) =>
    List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  String name;
  int price;
  String description;
  int amount;
  int? userId;
  String? userUsername;
  String thumbnail;

  ProductEntry({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.amount,
    required this.userId,
    required this.userUsername,
    required this.thumbnail,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        amount: json["amount"],
        userId: json["user_id"],
        userUsername: json["user_username"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "amount": amount,
        "user_id": userId,
        "user_username": userUsername,
        "thumbnail": thumbnail,
      };
}
