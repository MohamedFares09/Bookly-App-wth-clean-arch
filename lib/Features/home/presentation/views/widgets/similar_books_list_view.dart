import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: books.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(
                image: books[index].image ??'',
              ),
            );
          }),
    );
  }
}
