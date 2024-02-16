import 'package:flutter_test/flutter_test.dart';
import 'package:my_book_shelf/features/domain/entities/search_entity.dart';
import 'package:my_book_shelf/features/presentation/blocs/book/book_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'mock_data.dart';

void main() async {
  group('BookBloc', () {
    blocTest(
      'SearchBooks',
      build: () => BookBloc(),
      act: (bloc) => bloc.add(const SearchBooks('SearchText')),
      tearDown: () => [
        Success(books: SearchEntity.fromJson(MockData.books).items!)
      ], // Replace with your expected state after the event
    );

    blocTest(
      'GetFavorites',
      build: () => BookBloc(),
      act: (bloc) => bloc.add(const GetFavorites()),
      tearDown: () => [GetFavoritesBooks(favoritesBooks: MockData.favorites)],
    );
  });
}
