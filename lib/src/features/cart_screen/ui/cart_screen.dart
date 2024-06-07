import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Scaffold(
        body: Center(
          child: Text(
            "Cart Tab",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
