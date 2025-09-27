import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/usecases/fetch_newsed_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_book_state.dart';

class NewestBookCubit extends Cubit<NewestBookCubitState> {
  NewestBookCubit(this.fetchNewsedBooksUseCase)
      : super(NewestBookCubitInitial());
  final FetchNewsedBooksUseCase fetchNewsedBooksUseCase;
  Future<void> fetchNewsedBook() async {
    emit(NewestBookCubitLoadingState());
    var result = await fetchNewsedBooksUseCase.call();
    result.fold((l) {
      emit(NewestBookCubitFailuerState(errorMessage: l.message));
    }, (books) {
      emit(NewestBookCubitSuccessState(books: books));
    });
  }
}
