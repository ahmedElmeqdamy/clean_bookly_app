import 'package:flutter/material.dart';

import 'custom_button.dart';
class BookAction extends StatelessWidget {
  const BookAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            text: '19.99 LE',
            color: Colors.red,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
        ),
        Expanded(
          child: CustomButton(
            text: 'Preview',
            color: Colors.purple,
            textColor: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ],
    );
  }
}