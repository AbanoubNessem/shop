import 'package:shop/models/categories_model/categories_data_model.dart';
import 'package:shop/models/categories_model/category_data_model.dart';

class CategoriesModel{
  bool? status;
  CategoriesDataModel? data;
  CategoriesModel({this.status,this.data});
  CategoriesModel.formJson(Map<String,dynamic> json){
    status = json['status'];
    data =CategoriesDataModel.fromJson(json['data']);
  }
}
