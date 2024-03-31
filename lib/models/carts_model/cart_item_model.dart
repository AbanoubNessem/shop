import 'package:shop/models/carts_model/cart_product.dart';

class CartItemModel {
  int id;
  int quantity;
  CartProduct cartProduct;

  CartItemModel({
    required this.id,
    required this.quantity,
    required this.cartProduct,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
    id: json["id"],
    quantity: json["quantity"],
    cartProduct: CartProduct.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "quantity": quantity,
    "product": cartProduct.toJson(),
  };
}