// import 'package:shop/models/home_model/banners_model.dart';
// import 'package:shop/models/home_model/products_model.dart';
//
// class HomeDataModel {
//   List<BannersModel> banners;
//   List<ProductsModel> products;
//   HomeDataModel({required this.banners,required this.products});
//   factory HomeDataModel.fromJson(Map<String,dynamic>json){
//     return HomeDataModel(
//         banners: List<BannersModel>.from(json['banners'].map((x) => BannersModel.fromJson(x))),
//         products: List<ProductsModel>.from(json['products'].map((x) => ProductsModel.fromJson(x))),
//     );
//   }
// }

import 'package:shop/models/home_model/banners_model.dart';
import 'package:shop/models/home_model/products_model.dart';

class HomeDataModel {
  List<BannersModel>? banners;
  List<ProductsModel>? products;
  HomeDataModel({this.banners,this.products});
   HomeDataModel.fromJson(Map<String,dynamic>json){
      banners = List<BannersModel>.from(json['banners'].map((x) => BannersModel.fromJson(x)));
      products = List<ProductsModel>.from(json['products'].map((x) => ProductsModel.fromJson(x)));
  }
}