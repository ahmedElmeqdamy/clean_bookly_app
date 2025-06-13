import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_image.dart';
class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key, required this.books});
final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    print("Number of similar books: ${books.length}");

    return   SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        itemBuilder: (context, index) => Padding(
          padding:  EdgeInsets.only(left: 20.0,top: 20),
          child: CustomBookImage(image:books[index].image??'',),
        ),
      ),
    );
  }
}
//https://www.googleapis.com/books/v1/volumes?Filtering=free-ebooks&Sorting=newest&q=programming