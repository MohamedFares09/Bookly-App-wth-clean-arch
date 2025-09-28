import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key , required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SearchViewBody(
          book: book,
        ),
      ),
    );
  }
}
