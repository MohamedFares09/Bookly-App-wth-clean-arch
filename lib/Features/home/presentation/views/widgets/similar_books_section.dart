import 'package:bookly_clean_arch_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/usecases/fetch_simller_book_use_case.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/cubits/simller_books_cubit.dart/simller_books_cubit.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/simller_books_list_view_bloc_builder.dart';
import 'package:bookly_clean_arch_app/core/utils/functions/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.textStyle14.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        BlocProvider(
          create: (context) {
            return SimllerBooksCubit(
              FetchSimllerBookUseCase(getIt.get<HomeRepoImpl>()),
            )..fetchSimllerBooks();
          },
          child: SimllerBooksListViewBlocBuilder(),
        ),
      ],
    );
  }
}
