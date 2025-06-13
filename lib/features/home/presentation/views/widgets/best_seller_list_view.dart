import 'package:clean_bookly_code/features/home/presentation/manager/fetch_newest_books/fetch_newest_books_cubit.dart';
import 'package:clean_bookly_code/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/book_entity.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  final ScrollController _scrollController = ScrollController();
  var nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    final position = _scrollController.position;

    if (position.hasPixels && position.maxScrollExtent != 0) {
      final double scrolledRatio = position.pixels / position.maxScrollExtent;

      if (scrolledRatio >= 0.7) {
        if (!isLoading) {
          isLoading = true;
          await BlocProvider.of<NewestBooksCubit>(
            context,
          ).fetchNewestBooks(pageNumber: nextPage++); //    Call the function
          isLoading = false;
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.0),
          child: BookListViewItem(
            image: widget.books[index].image??'',
            title: widget.books[index].title??'',
            author: widget.books[index].authName??'',
            price: '1', rating: widget.books[index].rating??0,

          ),
        );
      },
    );
  }
}
