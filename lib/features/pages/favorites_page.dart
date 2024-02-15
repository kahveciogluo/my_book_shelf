import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/core/app_colors.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/features/pages/home_page.dart';
import 'package:my_book_shelf/features/widgets/app_state_widget.dart';
import 'package:my_book_shelf/features/widgets/book_card.dart';
import 'package:my_book_shelf/features/widgets/locale_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBackground,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<BookBloc>().add(const GetFavorites()),
          child: Scaffold(
              backgroundColor: AppColors.appBackground,
              appBar: AppBar(
                  backgroundColor: AppColors.appBackground,
                  title: const LocaleText(
                      text: LocaleKeys.favorites,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  leading: GestureDetector(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onTap: () {
                      context.read<BookBloc>().add(const SearchBooks(null));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                  )),
              body: BlocBuilder<BookBloc, BookState>(builder: (context, state) {
                /// MARK: Get All Books State
                if (state is GetFavoritesBooks) {
                  return state.favoritesBooks != null &&
                          state.favoritesBooks!.isNotEmpty
                      ? Padding(
                          padding:
                              EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: Text(
                                      LocaleKeys.countOfTotalContent.locale
                                          .replaceAll(
                                              "{COUNT}",
                                              state.favoritesBooks!.length
                                                  .toString()),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: ListView.separated(
                                      itemCount: state.favoritesBooks!.length,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 2.h),
                                      itemBuilder: (context, index) => BookCard(
                                          book: state.favoritesBooks![index])),
                                ),
                              )
                            ],
                          ),
                        )
                      : const AppStateWidget(
                          stateText:
                              LocaleKeys.youHaventAddedABookToYourFavoritesYet);
                }

                /// MARK: Loading State
                else if (state is Loading) {
                  return const AppStateWidget(stateText: LocaleKeys.loading);
                }

                /// MARK: Initial State
                else if (state is Initial) {
                  return const AppStateWidget(
                      stateText: LocaleKeys.initialHomePage);
                }

                /// MARK: Failure State
                else {
                  return const AppStateWidget(stateText: LocaleKeys.failure);
                }
              })),
        ),
      ),
    );
  }
}
