import 'package:clean_bookly_code/features/home/presentation/views/widgets/similar_books_section.dart';
import 'package:flutter/material.dart';
import 'book_detail_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // customScrollview momkn a5ly el widget el gwaha tkon expanded 3ady
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,// mohmaaaaaa
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                BookDetailSection(),
                Expanded(child: SizedBox(height: 20)),
                SimilarBooksSection(),
                SizedBox(height: 40,),
              ],
            ),
          ),
        )
      ],
    );

  }
}
