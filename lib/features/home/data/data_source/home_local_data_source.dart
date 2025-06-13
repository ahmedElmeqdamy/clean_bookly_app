import 'package:hive/hive.dart';

import '../../domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBook({int pageNumber = 0});

  List<BookEntity> fetchNewestBook({int pageNumber =0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBook({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>('featured_box');
    int lengthOfBox = box.values.length;
//start index 30  >= 25
    if (startIndex >= lengthOfBox || endIndex > lengthOfBox ) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> fetchNewestBook({int pageNumber =0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;

    var box = Hive.box<BookEntity>('newest_box');
    int lengthOfBox = box.values.length;
    if (startIndex >= lengthOfBox || endIndex > lengthOfBox ) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }
}
