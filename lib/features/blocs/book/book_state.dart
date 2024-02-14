part of 'book_bloc.dart';

sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

final class SearchBooksInitial extends BookState {}

final class SearchBooksLoading extends BookState {}

final class SearcBooksFailure extends BookState {}

final class SearchBooksSuccess extends BookState {
  final List<BookEntity> bookList;
  const SearchBooksSuccess(this.bookList);

  @override
  List<Object?> get props => [bookList];
}
