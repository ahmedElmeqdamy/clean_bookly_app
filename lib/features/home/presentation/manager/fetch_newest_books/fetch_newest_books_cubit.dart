import 'package:clean_bookly_code/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/fetch_newest_books/fetch_newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks({int pageNumber = 0 }) async {
    if(pageNumber == 0 ){
      emit(NewestBooksLoading());
    }else {
      emit(NewestBooksPaginationLoading());
    }

    var result = await fetchNewestBooksUseCase.call(pageNumber);

    result.fold(
      (failure) {
        if(pageNumber == 0 ){
          return emit(NewestBooksFailure(failure.message));
        }else {
          emit(NewestBooksPaginationFailure(failure.message));
        }

      },
      (books) {
        emit(NewestBooksSuccess(books));
      },
    );
  }
}
