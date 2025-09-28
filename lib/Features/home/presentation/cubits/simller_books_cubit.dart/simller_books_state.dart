part of 'simller_books_cubit.dart';

sealed class SimllerBooksState extends Equatable {
  const SimllerBooksState();

  @override
  List<Object> get props => [];
}

final class SimllerBooksInitial extends SimllerBooksState {}

final class SimllerBooksLoading extends SimllerBooksState {}

final class SimllerBooksSuccess extends SimllerBooksState {
  final List<BookEntity> bookEntity;

  const SimllerBooksSuccess({required this.bookEntity});
}

final class SimllerBooksFailure extends SimllerBooksState {
  final String errMessage;

const  SimllerBooksFailure({required this.errMessage}); 
}
