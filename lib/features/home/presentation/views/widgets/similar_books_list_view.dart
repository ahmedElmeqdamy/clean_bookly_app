import 'package:flutter/material.dart';

import 'custom_book_image.dart';
class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.only(left: 20.0,top: 20),
          child: CustomBookImage(image: '',),
        ),
      ),
    );
  }
}
