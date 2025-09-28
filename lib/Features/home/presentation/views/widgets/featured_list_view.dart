import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_clean_arch_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_book_image.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key, required this.books});
  final List<BookEntity> books;

  @override
  State<FeaturedBooksListView> createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  final ScrollController scrollController = ScrollController();
  int nextPage = 1;
  @override
  void initState() {
    scrollController.addListener(scrollLisner);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollLisner() {
    num currentPosition = scrollController.position.pixels;
    num maxPosition = scrollController.position.maxScrollExtent;
    if (currentPosition >= 0.85 * maxPosition) {
      context.read<FeaturedBooksCubit>().fetchFeaturedBooks(
            pageNumber: nextPage++,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsView,
                        extra: widget.books[index]);
                
                  },
                  child:
                      CustomBookImage(image: widget.books[index].image ?? '')),
            );
          }),
    );
  }
}
