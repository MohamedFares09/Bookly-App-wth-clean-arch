import 'package:bookly_clean_arch_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/core/utils/api_services.dart';

abstract class HomeRemoteDataSources {
    Future<List<BookEntity>> fetchFeaturedBooks();
  Future<List<BookEntity>> fetchNewestBooks();

}

class HomeRemoteDataSourcesImpl implements HomeRemoteDataSources {
  final ApiServices apiServices;

  HomeRemoteDataSourcesImpl(this.apiServices);

  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var data = await apiServices
        .get("volumes?Filtering=free-ebooks&Sorting=newest&q=Programing");
     List<BookEntity> books = getBookList(data);
    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
     var data = await apiServices
        .get("volumes?q=cumputer science");
     List<BookEntity> books = getBookList(data);
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