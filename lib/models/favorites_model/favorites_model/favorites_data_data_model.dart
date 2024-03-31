import 'package:shop/models/favorites_model/favorites_model/Favorites_product.dart';

class FavoritesDataDataModel {
  int? id;
  Product? product;

  FavoritesDataDataModel({
     this.id,
     this.product,
  });

   FavoritesDataDataModel.fromJson(Map<String, dynamic> json) {
     id = json["id"];
     product = Product.fromJson(json["product"]);
   }

}
