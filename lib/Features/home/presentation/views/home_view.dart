import 'package:bookly_clean_arch_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:bookly_clean_arch_app/core/utils/functions/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key ,required this.book});
  final List<BookEntity> book ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) {
          return FeaturedBooksCubit(
            FetchFeaturedBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          )..fetchFeaturedBooks();
        },
        child: HomeViewBody(
          book: book,
        ),
      ),
    );
  }
}
