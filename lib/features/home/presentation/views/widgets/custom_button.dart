import 'package:clean_bookly_code/core/utliti/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    this.borderRadius,
    required this.textColor,
  });

  final String text;
  final Color color;
  final BorderRadius? borderRadius;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: Styles.textStyle16.copyWith(
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
