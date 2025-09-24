import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveBooksData(List<BookEntity> books, String nameBox) {
  var box = Hive.box<BookEntity>(nameBox);
  box.addAll(books);
}
