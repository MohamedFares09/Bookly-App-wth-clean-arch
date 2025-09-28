import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key , required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextField(),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchResultListView(
              book: book,
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(
            book: book,
          ),
        );
      },
    );
  }
}
