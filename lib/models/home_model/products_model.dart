class ProductsModel {
  int id;
  double price;
  double oldPrice;
  int discount;
  String image;
  String description;
  String name;
  bool inFavorites;
  bool inCart;

  ProductsModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
        required this.description,
      required this.name,
      required this.inFavorites,
      required this.inCart});

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      price: json['price']?.toDouble(),
      oldPrice: json['old_price'].toDouble(),
      discount: json['discount'],
      image: json['image'],
      description: json['description'],
      name: json['name'],
      inFavorites: json['in_favorites'],
      inCart: json['in_cart'],
    );
  }
}

// class ProductsModel {
//   int? id;
//   double? price;
//   double? oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   bool? inFavorites;
//   bool? inCart;
//
//   ProductsModel(
//       { this.id,
//          this.price,
//          this.oldPrice,
//          this.discount,
//          this.image,
//          this.name,
//          this.inFavorites,
//          this.inCart});
//
//    ProductsModel.fromJson(Map<String, dynamic> json) {
//       id= json['id'];
//       price= json['price']?.toDouble();
//       oldPrice= json['old_price'].toDouble();
//       discount= json['discount'];
//       image= json['image'];
//       name= json['name'];
//       inFavorites= json['in_favorites'];
//       inCart= json['in_cart'];
//   }
// }
