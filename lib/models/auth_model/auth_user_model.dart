class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserModel({
      this.id,
     this.name,
     this.email,
     this.phone,
     this.image,
     this.points,
     this.credit,
     this.token,
  });
  UserModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id']= this.id;
    data['name']= this.name;
    data['email']= this.email;
    data['phone']= this.phone;
    data['image']= this.image;
    data['points']= this.points;
    data['credit']= this.credit;
    data['token']= this.token;
    return data;
  }

}