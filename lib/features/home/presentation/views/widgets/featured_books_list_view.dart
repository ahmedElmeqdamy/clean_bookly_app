import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/fetch_books_cubit/featured_books_cubit.dart';
import 'package:clean_bookly_code/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
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
          await BlocProvider.of<FeaturedBooksCubit>(
            context,
          ).fetchFeaturedBooks(pageNumber: nextPage++); //    Call the function
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.20,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder:
            (context, index) => Padding(
              padding:  EdgeInsets.only(left: 20.0, top: 20),
              child: CustomBookImage(image: widget.books[index].image ?? ''),
            ),
      ),
    );
  }
}
