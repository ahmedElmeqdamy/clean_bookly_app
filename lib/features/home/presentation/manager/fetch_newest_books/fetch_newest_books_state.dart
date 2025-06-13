import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:flutter/foundation.dart';
@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}
class NewestBooksPaginationLoading extends NewestBooksState {}

class NewestBooksPaginationFailure extends NewestBooksState {

  final String errorMessage ;
  NewestBooksPaginationFailure(this.errorMessage);
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}

class NewestBooksFailure extends NewestBooksState {
  final String errorMessage;

  NewestBooksFailure(this.errorMessage);
}
