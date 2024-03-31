
import 'package:shop/models/categories_items_model/categories_Items_data_model.dart';
import 'package:shop/models/favorites_model/favorites_model/favorites_data_model.dart';

class CategoriesItemsModel {
  bool? status;
  CategoriesItemsDataModel? data;

  CategoriesItemsModel({
    this.status,
    this.data,
  });

  CategoriesItemsModel.fromJson(Map<String, dynamic> json){
    status = json["status"];
    data = CategoriesItemsDataModel.fromJson(json["data"]);
  }

}






