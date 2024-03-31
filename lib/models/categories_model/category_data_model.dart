class CategoryDataModel {
  int? id;
  String? name;
  String? image;
  // String? description;
  // dynamic price;
  // dynamic oldPrice;
  // dynamic discount;
  // bool? inFavorites;
  // bool? inCart;

  CategoryDataModel(
      {this.id,
      this.name,
      this.image,
      // this.price,
      // this.discount,
      // this.description,
      // this.inCart,
      // this.inFavorites,
      // this.oldPrice
      });

  CategoryDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    // price = json['price'];
    // oldPrice = json['old_price'];
    // discount = json['discount'];
    // description = json['description'];
    // inFavorites = json['in_favorites'];
    // inCart = json['in_cart'];
  }
}
