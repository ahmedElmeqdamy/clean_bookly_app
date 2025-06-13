

import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
// b3ml abstract class b7dd eah el hyhsl msh hy7sl ezay zay dalel kda
abstract class HomeRepo {
Future<Either<Failure , List<BookEntity>>> fetchFeaturedBook({int pageNumber =0});
Future<Either<Failure , List<BookEntity>>>  fetchNewestBook({int pageNumber =0});
}