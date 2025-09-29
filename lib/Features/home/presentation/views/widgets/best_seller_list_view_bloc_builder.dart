import 'package:bookly_clean_arch_app/Features/home/presentation/cubits/newest_books_cubit/newest_book_cubit.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBookCubit, NewestBookState>(
      builder: (context, state) {
        if(state is NewestBookSuccessState){
           return SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(
              books: state.books,
            ),
          ),
        );
        } else if (state is NewestBookFailureState){
          return SliverFillRemaining(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }
       
      },
    );
  }
}
