import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/datasource/services/book_service.dart';
import 'package:my_book_shelf/models/book_entity.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(BookBlocInitial()) {
    on<SearchBooks>((event, emit) async {
      emit(BookBlocLoading());
      try {
        final resp = await BookService.fetchBooks(bookName: event.bookName);

        (resp != null && resp.items != null && resp.items!.isNotEmpty)
            ? emit(FetchBooksSuccess(books: resp.items!))
            : emit(FetchBooksFailure());
      } catch (_) {
        emit(FetchBooksFailure());
      }
    });
  }
}
