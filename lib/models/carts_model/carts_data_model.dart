import 'package:shop/models/carts_model/cart_item_model.dart';

class CartsDataModel {
  List<CartItemModel> cartItems;
  double subTotal;
  double total;

  CartsDataModel({
    required this.cartItems,
    required this.subTotal,
    required this.total,
  });

  factory CartsDataModel.fromJson(Map<String, dynamic> json) => CartsDataModel(
    cartItems: List<CartItemModel>.from(json["cart_items"].map((x) => CartItemModel.fromJson(x))),
    subTotal: json["sub_total"]?.toDouble(),
    total: json["total"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "cart_items": List<dynamic>.from(cartItems.map((x) => x.toJson())),
    "sub_total": subTotal,
    "total": total,
  };
}