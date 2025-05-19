
// b3ml abstract class b7dd eah el hyhsl msh hy7sl ezay zay dalel kda
import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
Future<List<BookEntity>> fetchFeaturedBook();
Future<List<BookEntity>> fetchNewestBook();
}