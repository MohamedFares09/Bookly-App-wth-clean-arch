import 'package:bookly_clean_arch_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/constants.dart';
import 'package:bookly_clean_arch_app/core/utils/api_services.dart';
import 'package:bookly_clean_arch_app/core/utils/functions/save_books_data.dart';

abstract class HomeRemoteDataSources {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchNewestBooks();
  Future<List<BookEntity>> fetchSimmlerBooks();
}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  final ApiServices apiServices;

  HomeRemoteDataSourcesImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiServices.get(
        "volumes?Filtering=free-ebooks&Sorting=newest&q=Programing& =${pageNumber * 10}");
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var data = await apiServices.get("volumes?q=cumputer science");
    List<BookEntity> books = getBookList(data);
    saveBooksData(books, kNewsedBooks);
    return books;
  }



  @override
  Future<List<BookEntity>> fetchSimmlerBooks() async {
    var data = await apiServices.get("volumes?Filtering=free-ebooks&Sorting=relevance&q=Programing");
    List<BookEntity> books = getBookList(data);
    // Save similar books to the dedicated box
    saveBooksData(books, kSimmlerBooks);
    return books;
  }

    List<BookEntity> getBookList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  }
}



// 