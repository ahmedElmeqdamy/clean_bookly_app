import 'package:flutter/material.dart';
import '../../../../../core/utliti/styles.dart';
import 'book_action.dart';
import 'book_rating.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';
class BookDetailSection extends StatelessWidget {
  const BookDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        CustomBookDetailsAppBar(),
        // 3ayz ahafez 3la shakl al sora
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.20,
          ),
          child: CustomBookImage(),
        ),
        SizedBox(height: 10),
        Text(
          'GITMO AND BACK AGAIN',
          style: Styles.textStyle21.copyWith(color: Colors.black),
        ),
        SizedBox(height: 10),
        Opacity(
          opacity: 0.3,
          child: Text(
            'J.K HARRY Potter',
            style: Styles.textStyle18.copyWith(color: Colors.black),
          ),
        ),
        BookRating(),
        SizedBox(height: 37),
        BookAction(),
      ],
    );
  }
}
