part of 'book_bloc.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

final class Initial extends BookState {}

final class Loading extends BookState {}

final class Failure extends BookState {}

final class GetAllBooks extends BookState {
  final List<BookEntity>? allBooks;
  const GetAllBooks({required this.allBooks});

  @override
  List<Object?> get props => [allBooks];
}

final class UpdateFavoriteBooks extends BookState {
  final List<BookEntity> favoritesBooks;
  const UpdateFavoriteBooks({required this.favoritesBooks});

  @override
  List<Object> get props => [favoritesBooks];
}

final class GetFavoritesBooks extends BookState {
  final List<BookEntity> favoritesBooks;
  const GetFavoritesBooks({required this.favoritesBooks});

  @override
  List<Object> get props => [favoritesBooks];
}
