import 'package:clean_bookly_code/core/utliti/styles.dart';
import 'package:flutter/material.dart';

import 'best_seller_list_view.dart';

import 'custom_app_bar.dart';

import 'featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        // lazm a5li al shrinkwrap = true
        SliverToBoxAdapter(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: CustomAppBar(),
            ),
            FeaturedBooksListView(),
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'New Collection Books',
                style: Styles.textStyle21.copyWith(fontFamily: 'Gt Sectra Fine'),
              ),
            ),
            SizedBox(height: 20),

          ],
        ),),
        // hymla el goz2 el fadl
        // msh bht shrinkwrap fiha
        SliverFillRemaining(child:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: BestSellerListView(),
        ),)

      ],
    );

  }
}
