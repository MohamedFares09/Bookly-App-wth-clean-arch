import 'package:bookly_clean_arch_app/Features/home/data/data_source/home_local_date_sources.dart';
import 'package:bookly_clean_arch_app/Features/home/data/data_source/home_remote_data_sources.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/repos/home_repo.dart';
import 'package:bookly_clean_arch_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSources homeRemoteDataSources;
  final HomeLocalDateSources homeLocalDateSources;

  HomeRepoImpl(
      {required this.homeRemoteDataSources,
      required this.homeLocalDateSources});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks() async {
    try {
      var bookLocalDataSources = homeLocalDateSources.fetchFeaturedBooks();
      if (bookLocalDataSources.isNotEmpty) {
        return right(bookLocalDataSources);
      }
      var books = await homeRemoteDataSources.fetchFeaturedBooks();
      return right(books);
    } on Exception catch (e) {
      return left(Failure());
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks()async {
  try {
      var bookLocalDataSources = homeLocalDateSources.fetchNewestBooks();
      if (bookLocalDataSources.isNotEmpty) {
        return right(bookLocalDataSources);
      }
      var books = await homeRemoteDataSources.fetchNewestBooks();
      return right(books);
    } on Exception catch (e) {
      return left(Failure());
    }
  }
}
