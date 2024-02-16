import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/features/data/database/database.dart';
import 'package:my_book_shelf/features/domain/repositories/book_repository.dart';
import 'package:my_book_shelf/features/domain/entities/book_entity.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(Initial()) {
    List<BookEntity>? allBooks;

    on<SearchBooks>((event, emit) async {
      if (event.searchText != null && event.searchText!.isNotEmpty) {
        emit(Loading());
        try {
          final resp =
              await BookRepository.fetchBooks(bookName: event.searchText!);
          allBooks = resp!.items;
          emit(Success(books: allBooks));
        } catch (_) {
          emit(Failure());
        }
      } else {
        emit(Initial());
      }
    });

    on<GetFavorites>((event, emit) {
      emit(Loading());
      try {
        emit(GetFavoritesBooks(
            favoritesBooks:
                Database.getFavoritesFromDatabase().values.toList()));
      } catch (_) {
        emit(Failure());
      }
    });

    on<AddBookToFavorites>((event, emit) {
      try {
        Database.addBookToFavoritesDatabase(event.book);
        emit(Success(books: allBooks));
      } catch (_) {}
    });

    on<DeleteBookFromHomePage>((event, emit) {
      try {
        Database.deleteBookFromFavoritesDatabase(event.book);
        emit(Success(books: allBooks));
      } catch (_) {}
    });

    on<DeleteBookFromFavoritesPage>((event, emit) {
      try {
        Database.deleteBookFromFavoritesDatabase(event.book);
        emit(GetFavoritesBooks(
            favoritesBooks:
                Database.getFavoritesFromDatabase().values.toList()));
      } catch (_) {}
    });
  }
}
