// import 'package:shop/models/home_model/home_data_model.dart';
//
// class HomeModel{
//   bool status;
//   HomeDataModel data;
//   HomeModel({required this.status, required this.data});
//   factory HomeModel.fromJson(Map<String,dynamic>json) {
//     return HomeModel(
//       status: json['status'],
//       data: HomeDataModel.fromJson(json['data']),
//   );
//   }
// }


import 'package:shop/models/home_model/home_data_model.dart';

class HomeModel{
  bool? status;
  HomeDataModel? data;
  HomeModel({ this.status,  this.data});
   HomeModel.fromJson(Map<String,dynamic>json) {

      status = json['status'];
      data = HomeDataModel.fromJson(json['data']);
  }
}

