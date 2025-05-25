import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook();

  List<BookEntity> fetchNewestBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBook() {
    var box = Hive.box<BookEntity>('featured_box');
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBook() {
    var box = Hive.box<BookEntity>('newest_box');
    return box.values.toList();
  }
}
