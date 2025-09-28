import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/constants.dart';
import 'package:hive_flutter/adapters.dart';

abstract class HomeLocalDateSources {
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
  List<BookEntity> fetchNewestBooks();
  List<BookEntity> fetchSimmlerBooks();
}

class HomeLocalDataSourcesImpl implements HomeLocalDateSources {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    var box = Hive.box<BookEntity>(kFeaturedBooks);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    var box = Hive.box<BookEntity>(kNewsedBooks);
    return box.values.toList();
  }

  @override
  List<BookEntity> fetchSimmlerBooks() {
    var box = Hive.box<BookEntity>(kSimmlerBooks);
    return box.values.toList();
  }
}
