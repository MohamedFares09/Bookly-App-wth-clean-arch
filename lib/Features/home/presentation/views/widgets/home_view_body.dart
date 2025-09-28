import 'package:bookly_clean_arch_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/usecases/fetch_newsed_books_use_case.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/cubits/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/best_seller_list_view_bloc_builder.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/featured_books_listview_blocbuilder.dart';
import 'package:bookly_clean_arch_app/core/utils/functions/get_it.dart';
import 'package:bookly_clean_arch_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: CustomAppBar()),
              FeaturedBooksListViewBlocBuilder(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Best Seller',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        BlocProvider(
          create: (context) {
            return NewestBookCubit(
              FetchNewsedBooksUseCase(
                getIt.get<HomeRepoImpl>(),
              ),
            )..fetchNewsedBook();
          },
          child: const BestSellerListViewBlocBuilder(),
        )
      ],
    );
  }
}
