import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> featchFeaturedBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await featuredBooksUseCase.call();
    result.fold((l) {
      emit(FeaturedBooksFailureState(errorMessage: l.message));
    }, (books) {
      emit(FeaturedBooksSuccessState(books: books));
    });
  }

    Future<void> featchNewsetBooks() async {
    emit(FeaturedBooksLoadingState());
    var result = await featuredBooksUseCase.call();
    result.fold((l) {
      emit(FeaturedBooksFailureState(errorMessage: l.message));
    }, (books) {
      emit(FeaturedBooksSuccessState(books: books));
    });
  }
}
