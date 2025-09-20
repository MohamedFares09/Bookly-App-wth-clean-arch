import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDateSources {
  List<BookEntity> fetchFeaturedBooks();
  List<BookEntity> fetchNewestBooks();
}
