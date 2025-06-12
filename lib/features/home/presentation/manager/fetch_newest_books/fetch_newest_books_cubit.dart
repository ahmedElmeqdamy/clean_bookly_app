import 'package:clean_bookly_code/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/fetch_newest_books/fetch_newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call();

    result.fold(
      (failure) {
        return emit(NewestBooksFailure(failure.message));
      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
