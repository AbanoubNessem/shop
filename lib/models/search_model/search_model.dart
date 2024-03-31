
import 'package:shop/models/search_model/search_data_model.dart';

class SearchModel {
  bool? status;

  Data? data;

  SearchModel({
     this.status,
     this.data,
  });

   SearchModel.fromJson(Map<String, dynamic> json){
     status =json["status"];
     data = Data.fromJson(json["data"]);
   }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}



