import 'package:shop/models/categories_model/category_data_model.dart';

class CategoriesDataModel {
  int? currentPage;
  List<CategoryDataModel>? data;

  CategoriesDataModel({this.currentPage,this.data});
  CategoriesDataModel.fromJson(Map<String,dynamic> json){
    currentPage = json['current_page'];
    data = List<CategoryDataModel>.from(json['data'].map((x) => CategoryDataModel.fromJson(x)));
  }
}