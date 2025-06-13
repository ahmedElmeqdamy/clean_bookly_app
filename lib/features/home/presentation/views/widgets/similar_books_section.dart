import 'package:clean_bookly_code/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utliti/styles.dart';
class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'you can also like',
            style: Styles.textStyle21.copyWith(color: Colors.black),
          ),
        ),
        SimilarBooksListView(books: [],),
      ],
    );
  }
}
