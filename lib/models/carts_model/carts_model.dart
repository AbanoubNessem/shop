

import 'package:shop/models/carts_model/carts_data_model.dart';

class CartsModel {
  bool? status;
  CartsDataModel? data;

  CartsModel({
     this.status,
     this.data,
  });

  CartsModel.fromJson(Map<String, dynamic> json) {
    status =json["status"];
    data = CartsDataModel.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}






