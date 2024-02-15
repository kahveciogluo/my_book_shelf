import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/database/database.dart';
import 'package:my_book_shelf/datasource/services/book_service.dart';
import 'package:my_book_shelf/models/book_entity.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(Initial()) {
    List<BookEntity> favorites = [];
    List<BookEntity>? allBooks;

    on<FetchBooks>((event, emit) async {
      emit(Loading());
      try {
        final resp = await BookService.fetchBooks(bookName: event.searchText);
        allBooks = resp!.items;
        emit(GetAllBooks(allBooks: allBooks));
      } catch (_) {
        emit(Failure());
      }
    });

    on<AddBookToFavoritesFromHomePage>((event, emit) {
      try {
        Database.getFavorites().add(event.book);
        favorites.add(event.book);
        emit(GetAllBooks(allBooks: allBooks));
      } catch (_) {}
    });

    on<DeleteBookFromFavoritesFromHomePage>((event, emit) {
      try {
        Database.getFavorites().delete(event.book);
        favorites.remove(event.book);
        emit(GetAllBooks(allBooks: allBooks));
      } catch (_) {}
    });

    on<GetFavorites>((event, emit) {
      emit(Loading());
      try {
        emit(GetFavoritesBooks(
            favoritesBooks: Database.getFavorites().values.toList()));
      } catch (_) {
        emit(Failure());
      }
    });
  }
}
