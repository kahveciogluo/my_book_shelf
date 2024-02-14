part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

final class BookBlocInitial extends BookState {}

final class BookBlocLoading extends BookState {}

final class FetchBooksFailure extends BookState {}

final class FetchBooksSuccess extends BookState {
  final List<BookEntity> books;
  const FetchBooksSuccess({required this.books});

  @override
  List<Object> get props => [books];
}
