import 'package:shop/models/auth_model/auth_user_model.dart';

class AuthModel{
  bool? status;
  String? message;
  UserModel? data;

  AuthModel({
    this.status,
    this.message,
    this.data
});
  AuthModel.formJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserModel.fromJson(json['data']):null;
  }
}