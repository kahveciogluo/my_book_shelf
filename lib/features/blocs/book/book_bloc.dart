import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/datasource/services/book_service.dart';
import 'package:my_book_shelf/models/book_entity.dart';
part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(SearchBooksInitial()) {
    on<SearchBooks>((event, emit) async {
      emit(SearchBooksLoading());
      try {
        final resp = await BookService.fetchBooks(bookName: event.bookName);

        resp?.items != null
            ? emit(SearchBooksSuccess(resp!.items!))
            : emit(SearcBooksFailure());
      } catch (_) {
        emit(SearcBooksFailure());
      }
    });
  }
}
