part of 'newest_book_cubit_cubit.dart';

sealed class NewestBookCubitState extends Equatable {
  const NewestBookCubitState();

  @override
  List<Object> get props => [];
}

final class NewestBookCubitInitial extends NewestBookCubitState {}

final class NewestBookCubitLoadingState extends NewestBookCubitState {}

final class NewestBookCubitSuccessState extends NewestBookCubitState {
  final List<BookEntity> books;

  const NewestBookCubitSuccessState({required this.books});
}

final class NewestBookCubitFailuerState extends NewestBookCubitState {
  final String errorMessage;

  const NewestBookCubitFailuerState({required this.errorMessage});
}
