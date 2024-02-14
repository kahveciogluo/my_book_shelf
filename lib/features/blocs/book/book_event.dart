part of 'book_bloc.dart';

sealed class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class SearchBooks extends BookEvent {
  final String bookName;
  const SearchBooks(this.bookName);
}
