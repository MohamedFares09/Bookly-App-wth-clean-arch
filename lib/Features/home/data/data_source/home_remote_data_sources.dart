import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';

abstract class HomeRemoteDataSources {
  Future<BookEntity> fetchNewestBooks();
  Future<BookEntity> fetchFeaturedBooks();
}
class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  @override
  Future<BookEntity> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  Future<BookEntity> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}