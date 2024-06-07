import 'package:flutter/material.dart';

class MenuScreen  extends StatelessWidget  {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Scaffold(
        body: Center(
          child: Text(
            "Menu Tab",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}