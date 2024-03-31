import 'package:shop/models/search_model/search_product.dart';

class Data {
  int? currentPage;
  List<SearchProduct>? data;


  Data({
     this.currentPage,
     this.data,

  });

   Data.fromJson(Map<String, dynamic> json){
     currentPage=json["current_page"];
     data= List<SearchProduct>.from(json["data"].map((x) => SearchProduct.fromJson(x)));

   }

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),

  };
}
