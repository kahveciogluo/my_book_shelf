part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class FetchBooks extends BookEvent {
  final String searchText;
  const FetchBooks(this.searchText);
}

class AddBookToFavoritesFromHomePage extends BookEvent {
  final BookEntity book;
  const AddBookToFavoritesFromHomePage(this.book);
}

class DeleteBookFromFavoritesFromHomePage extends BookEvent {
  final BookEntity book;
  const DeleteBookFromFavoritesFromHomePage(this.book);
}

class GetFavorites extends BookEvent {
  const GetFavorites();
}
