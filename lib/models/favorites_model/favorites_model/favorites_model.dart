
import 'package:shop/models/favorites_model/favorites_model/favorites_data_model.dart';

class FavoritesModel {
  bool? status;
  FavoritesDataModel? data;

  FavoritesModel({
     this.status,
     this.data,
  });

   FavoritesModel.fromJson(Map<String, dynamic> json){
     status = json["status"];
     data = FavoritesDataModel.fromJson(json["data"]);
  }

}






