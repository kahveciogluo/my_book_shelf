part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

final class Initial extends BookState {}

final class Loading extends BookState {}

final class Failure extends BookState {}

final class Success extends BookState {
  final List<BookEntity>? books;
  const Success({required this.books});

  @override
  List<Object?> get props => [books];
}

final class GetFavoritesBooks extends BookState {
  final List<BookEntity>? favoritesBooks;
  const GetFavoritesBooks({required this.favoritesBooks});

  @override
  List<Object?> get props => [favoritesBooks];
}
