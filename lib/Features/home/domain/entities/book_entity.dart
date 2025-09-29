import 'package:hive/hive.dart';
part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity extends HiveObject {
  @HiveField(0)
  String  bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String? title;
  @HiveField(3)
  final String? authorName;
  @HiveField(4)
  final num? price;
  @HiveField(5)
  final num? rating;

  final String? previewLink;

  BookEntity(
      {
        required this.bookId,
        required this.image,
      required this.title,
      required this.authorName,
      required this.price,
      required this.rating,
      this.previewLink,
      });
}
//flutter pub run build_runner build