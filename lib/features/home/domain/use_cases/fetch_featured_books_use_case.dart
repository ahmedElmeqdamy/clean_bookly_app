import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

import '../../../../core/use_cases/use_cases.dart';
import '../entities/book_entity.dart';
import '../repo/home_repo.dart';

// use case byt3ml 3shan ay haga by3mlha el user
class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>,NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParam? param])async {

    return await homeRepo.fetchFeaturedBook();
  }

}


