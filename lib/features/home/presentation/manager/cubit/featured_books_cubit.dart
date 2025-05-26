import 'package:clean_bookly_code/features/home/presentation/manager/cubit/featured_books_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>{
  FeaturedBooksCubit(): super(FeaturedBooksInitial());

}