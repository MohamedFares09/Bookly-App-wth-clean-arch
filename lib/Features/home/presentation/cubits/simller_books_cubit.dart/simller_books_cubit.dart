import 'package:bookly_clean_arch_app/Features/home/domain/entities/book_entity.dart';
import 'package:bookly_clean_arch_app/Features/home/domain/usecases/fetch_simller_book_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'simller_books_state.dart';

class SimllerBooksCubit extends Cubit<SimllerBooksState> {
  SimllerBooksCubit(this.fetchSimllerBookUseCase) : super(SimllerBooksInitial());
  final FetchSimllerBookUseCase fetchSimllerBookUseCase; 
    Future<void> fetchSimllerBooks() async {
    emit(SimllerBooksLoading());
    var result = await fetchSimllerBookUseCase.call();
    result.fold((l) {
      emit(SimllerBooksFailure(errMessage: l.message));
    }, (books) {
      emit(SimllerBooksSuccess(bookEntity: books));
    });
  }
}
