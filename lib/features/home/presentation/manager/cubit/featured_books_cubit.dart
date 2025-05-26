import 'package:clean_bookly_code/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>{
  FeaturedBooksCubit(this.featuredBooksUseCase): super(FeaturedBooksInitial());

  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks ()async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call();
    result.fold((failure){
      emit(FeaturedBooksFailure(failure.message));
    }, (books){
      emit(FeaturedBooksSuccess(books));
    });
  }

}