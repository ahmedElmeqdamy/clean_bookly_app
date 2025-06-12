import 'package:clean_bookly_code/core/utliti/api_services.dart';
import 'package:clean_bookly_code/features/home/data/models/books_model/book_model.dart';
import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0});

  Future<List<BookEntity>> fetchNewestBook();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBook({int pageNumber = 0}) async {
    var data = await apiService.get(
      endPoint:
          'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber * 10}', // ana drbt fi 10 3shan ana 3ayz safha rakm index l 10 saf7at odam
    );
    List<BookEntity> books = getBooksList(data);

    // 3-save data to box Hive
    saveDataToHive(books, 'featured_box');
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBook() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
    // 3-save data to box Hive
    saveDataToHive(books, 'newest_box');
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookItem in data['items']) {
      books.add(BookModel.fromJson(bookItem));
    }
    return books;
  }
}

void saveDataToHive(List<BookEntity> books, String name) {
  var box = Hive.box<BookEntity>(name);
  box.addAll(books);
}
