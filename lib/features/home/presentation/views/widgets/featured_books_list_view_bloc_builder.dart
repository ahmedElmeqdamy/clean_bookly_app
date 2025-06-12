import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/fetch_books_cubit/featured_books_cubit.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/fetch_books_cubit/featured_books_states.dart';
import 'package:clean_bookly_code/features/home/presentation/views/widgets/featured_books_list_view_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_books_list_view.dart';

class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({super.key});

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() =>
      _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState
    extends State<FeaturedBooksListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksStates>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksPaginationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.black,
              duration: Duration(seconds: 2),
              content: Text(
                state.errorMessage,
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        // return FeaturedBooksListViewLoadingIndicator();
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedBooksListView(books: books);
        } else if (state is FeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
