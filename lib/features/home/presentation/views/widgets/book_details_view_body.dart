import 'package:clean_bookly_code/core/utliti/styles.dart';
import 'package:clean_bookly_code/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

import 'book_action.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_book_image.dart';
import 'custom_button.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
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
      ),
    );
  }
}


