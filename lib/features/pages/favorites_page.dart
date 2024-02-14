import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/features/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/features/widgets/locale_text.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const LocaleText(
          text: LocaleKeys.myFavoriteBooks,
        ),
      ),
      body: BlocBuilder<BookBloc, BookState>(
          builder: (context, state) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(LocaleKeys.author.locale),
                  const SizedBox(height: 100),
                  if (state is SearchBooksSuccess)
                    Text(state.bookList.toString()),
                  IconButton(
                      onPressed: () => context
                          .read<BookBloc>()
                          .add(const SearchBooks('ÖZlem')),
                      icon: const Icon(Icons.add))
                ],
              )),
    );
  }
}
