part of 'book_bloc.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

class SearchBooks extends BookEvent {
  final String? searchText;
  const SearchBooks(this.searchText);
}

class AddBookToFavorites extends BookEvent {
  final BookEntity book;
  const AddBookToFavorites(this.book);
}

class DeleteBookFromHomePage extends BookEvent {
  final BookEntity book;
  const DeleteBookFromHomePage(this.book);
}

class GetFavorites extends BookEvent {
  const GetFavorites();
}

class DeleteBookFromFavoritesPage extends BookEvent {
  final BookEntity book;
  const DeleteBookFromFavoritesPage(this.book);
}
