
class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.inCart,
  });
  int id;
  String name;
  double price;
  String description;
  bool inCart;
// fromJson
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    price: json["price"].toDouble(),
    description: json["description"],
    inCart: json["inCart"],
  );
  

}
