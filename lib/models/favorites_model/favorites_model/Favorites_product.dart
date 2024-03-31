class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  String? description;

  Product({
     this.id,
     this.price,
     this.oldPrice,
     this.discount,
     this.image,
     this.name,
     this.description,
  });

   Product.fromJson(Map<String, dynamic> json) {
    id= json["id"];
    price= json["price"];
    oldPrice= json["old_price"];
    discount= json["discount"];
    image= json["image"];
    name= json["name"];
    description= json["description"];
 }


}