import 'package:clean_bookly_code/core/utliti/styles.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(),
        FeaturedBooksListView(),
        Text('best seller', style: Styles.textStyle20),
      ],
    );
  }
}
