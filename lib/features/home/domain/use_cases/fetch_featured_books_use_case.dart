import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/book_entity.dart';
import '../repo/home_repo.dart';

// use case byt3ml 3shan ay haga by3mlha el user
class FetchFeaturedBooksUseCase {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook() {
    //check permission
    return homeRepo.fetchFeaturedBook();
  }
}
