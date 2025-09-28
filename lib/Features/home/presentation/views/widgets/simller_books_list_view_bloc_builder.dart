
import 'package:bookly_clean_arch_app/Features/home/presentation/cubits/simller_books_cubit.dart/simller_books_cubit.dart';
import 'package:bookly_clean_arch_app/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimllerBooksListViewBlocBuilder extends StatelessWidget {
  const SimllerBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimllerBooksCubit, SimllerBooksState>(
      builder: (context, state) {
        if (state is SimllerBooksSuccess) {
          return SimilarBooksListview(
            books: state.bookEntity,
          );
        } else if (state is SimllerBooksFailure) {
          return Center(
            child: Text('${state.errMessage}'),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
