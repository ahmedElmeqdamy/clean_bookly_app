class BookEntity {
  final String? bookId;
  final String? image;
  final String? title;
  final String? authName;
  final num? price;

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
