import 'package:bookly_clean_arch_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/usecases/fetch_newsed_books_use_case.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/cubits/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly_clean_arch_app/Features/search/presentation/views/widgets/search_view_body.dart';
import 'package:bookly_clean_arch_app/core/utils/functions/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.book});
  final List<BookEntity> book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider(
        create: (context) {
          return NewestBookCubit(
            FetchNewsedBooksUseCase(getIt.get<HomeRepoImpl>()),
          )..fetchNewsedBook();
        },
        child: BlocBuilder<NewestBookCubit, NewestBookState>(
          builder: (context, state) {
            if (state is NewestBookSuccessState) {
              return SearchViewBody(book: state.books); // ← هنا بتمرر الكتب
            } else if (state is NewestBookFailureState) {
              return Center(child: Text(state.errorMessage));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      )),
    );
  }
}
