import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';

abstract class FeaturedBooksStates {}

class FeaturedBooksInitial extends FeaturedBooksStates{}

class FeaturedBooksLoading extends FeaturedBooksStates {}

class FeaturedBooksPaginationLoading extends FeaturedBooksStates {}
class FeaturedBooksPaginationFailure extends FeaturedBooksStates {
  final String errorMessage;
  FeaturedBooksPaginationFailure(this.errorMessage);
}

class FeaturedBooksSuccess extends FeaturedBooksStates {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}

class FeaturedBooksFailure extends FeaturedBooksStates {
  final String errorMessage;

  FeaturedBooksFailure(this.errorMessage);
}
