import 'package:clean_bookly_code/core/utliti/styles.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view_item.dart';
import 'custom_app_bar.dart';

import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(),
          FeaturedBooksListView(),
          SizedBox(height: 25),
          Text(
            'New Collection Books',
            style: Styles.textStyle21.copyWith(fontFamily: 'Gt Sectra Fine'),
          ),
          SizedBox(height: 20),
          BestSellerListViewItem(),
        ],
      ),
    );
  }
}
