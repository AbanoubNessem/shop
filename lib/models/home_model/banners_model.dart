// class BannersModel{
//   int id;
//   String image;
//
//   BannersModel({required this.id,required this.image});
//   factory BannersModel.fromJson(Map<String,dynamic> json){
//     return BannersModel(
//         id: json['id'],
//         image: json['image'],
//     );
//   }
// }

class BannersModel{
  int? id;
  String? image;

  BannersModel({ this.id, this.image});
   BannersModel.fromJson(Map<String,dynamic> json){

      id= json['id'];
      image= json['image'];
  }
}