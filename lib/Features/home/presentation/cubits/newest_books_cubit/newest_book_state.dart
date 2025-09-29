part of 'newest_book_cubit.dart';

sealed class NewestBookState extends Equatable {
  const NewestBookState();

  @override
  List<Object> get props => [];
}

final class NewestBookInitial extends NewestBookState {}

final class NewestBookLoadingState extends NewestBookState {}

final class NewestBookSuccessState extends NewestBookState {
  final List<BookEntity> books;

  const NewestBookSuccessState({required this.books});
}

final class NewestBookFailureState extends NewestBookState {
  final String errorMessage;

  const NewestBookFailureState({required this.errorMessage});
}
