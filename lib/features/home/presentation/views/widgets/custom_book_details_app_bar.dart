import 'package:flutter/material.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.close, color: Colors.black),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart_sharp, color: Colors.black),
        ),
      ],
    );
  }
}
