class SearchProduct {
  int? id;
  dynamic price;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  SearchProduct({
     this.id,
     this.price,
     this.image,
     this.name,
     this.description,
     this.images,
     this.inFavorites,
     this.inCart,
  });

   SearchProduct.fromJson(Map<String, dynamic> json) {
    id= json["id"];
    price= json["price"];
    image= json["image"];
    name= json["name"];
    description= json["description"];
    images= List<String>.from(json["images"].map((x) => x));
    inFavorites= json["in_favorites"];
    inCart= json["in_cart"];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "price": price,
    "image": image,
    "name": name,
    "description": description,
    "images": List<dynamic>.from(images!.map((x) => x)),
    "in_favorites": inFavorites,
    "in_cart": inCart,
  };
}