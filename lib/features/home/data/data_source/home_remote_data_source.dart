import 'package:clean_bookly_code/core/utliti/api_services.dart';
import 'package:clean_bookly_code/features/home/data/models/books_model/book_model.dart';
import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBook();

  Future<List<BookEntity>> fetchNewestBook();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<BookEntity>> fetchFeaturedBook() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&q=programming',
    );
    List<BookEntity> books = getBooksList(data);

    // save data to box
    saveDataToHive(books,'featured_box');
    return books;
  }



  @override
  Future<List<BookEntity>> fetchNewestBook() async {
    var data = await apiService.get(
      endPoint: 'volumes?Filtering=free-ebooks&Sorting=newest&q=programming',
    );
    List<BookEntity> books = getBooksList(data);
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
void saveDataToHive(List<BookEntity> books,String name) {
  var box = Hive.box(name);
  box.addAll(books);
}