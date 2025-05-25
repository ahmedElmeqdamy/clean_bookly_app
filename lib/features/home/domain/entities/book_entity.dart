import 'package:hive/hive.dart';

part 'book_entity.g.dart';
// 2-hive type
@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String? bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? authName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;

  BookEntity({
    this.image,
    this.title,
    this.authName,
    this.price,
    this.rating,
    this.bookId,
  });
}
