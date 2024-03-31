class FavoritesAddOrDeleteModel{
  bool?  status;
  String? message;

  FavoritesAddOrDeleteModel({this.status,this.message});
  FavoritesAddOrDeleteModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}