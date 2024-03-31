import 'package:shop/models/favorites_model/favorites_model/Favorites_product.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_data_data_model.dart';
import 'package:shop/models/home_model/products_model.dart';

class CategoriesItemsDataModel {
  int? currentPage;
  List<ProductsModel>? data;

  CategoriesItemsDataModel({
    this.currentPage,
    this.data,
  });

  CategoriesItemsDataModel.fromJson(Map<String, dynamic> json) {
    currentPage = json["current_page"];
    data = List<ProductsModel>.from(json["data"].map((x) => ProductsModel.fromJson(x)));
  }

}