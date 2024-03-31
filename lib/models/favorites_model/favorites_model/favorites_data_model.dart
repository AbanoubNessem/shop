import 'package:shop/models/favorites_model/favorites_model/favorites_data_data_model.dart';

class FavoritesDataModel {
  int? currentPage;
  List<FavoritesDataDataModel>? data;

  FavoritesDataModel({
     this.currentPage,
     this.data,
  });

   FavoritesDataModel.fromJson(Map<String, dynamic> json) {
     currentPage = json["current_page"];
     data = List<FavoritesDataDataModel>.from(json["data"].map((x) => FavoritesDataDataModel.fromJson(x)));
   }

}