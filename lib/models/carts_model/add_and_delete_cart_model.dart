class AddAddDeleteCartModel{
  bool?  status;
  String? message;

  AddAddDeleteCartModel({this.status,this.message});
  AddAddDeleteCartModel.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
  }
}