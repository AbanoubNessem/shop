import 'package:flutter/material.dart';
import 'package:shop/screens/cart_screen/components/carts_body_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: CartsBodyScreen(),
      );
  }
}
