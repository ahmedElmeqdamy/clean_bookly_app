import 'package:clean_bookly_code/core/errors/failure.dart';
import 'package:clean_bookly_code/features/home/data/data_source/home_local_data_source.dart';
import 'package:clean_bookly_code/features/home/data/data_source/home_remote_data_source.dart';
import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:clean_bookly_code/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeReposImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeReposImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBook({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchFeaturedBook(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBook(
        pageNumber: pageNumber,
      );
      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBook() async {
    try {
      List<BookEntity> books;
      books = homeLocalDataSource.fetchNewestBook();
      if (books.isNotEmpty) {
        return right(books);
      }

      books = await homeRemoteDataSource.fetchNewestBook();

      return right(books);
    } catch (error) {
      if (error is DioException) {
        return left(ServerFailure.fromDioError(error));
      }
      return left(ServerFailure(error.toString()));
    }
  }
}
