import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/core/app_colors.dart';
import 'package:my_book_shelf/core/app_globals.dart';
import 'package:my_book_shelf/core/app_images.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/features/pages/favorites_page.dart';
import 'package:my_book_shelf/features/widgets/app_state_widget.dart';
import 'package:my_book_shelf/features/widgets/book_card.dart';
import 'package:my_book_shelf/features/widgets/search_component.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBackground,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<BookBloc>().add(const SearchBooks('Özlem')),
          child: Scaffold(
              key: AppGlobals.globalKey,
              backgroundColor: AppColors.appBackground,
              appBar: AppBar(
                backgroundColor: AppColors.appBackground,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: IconButton(
                        onPressed: () {
                          context.read<BookBloc>().add(const GetFavorites());
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FavoritesPage()));
                        },
                        icon: Image.asset(AppImages.heart,
                            color: Colors.white,
                            height: 4.h,
                            fit: BoxFit.contain)),
                  )
                ],
              ),
              body: BlocBuilder<BookBloc, BookState>(builder: (context, state) {
                /// MARK: Get All Books State
                if (state is Success) {
                  return state.books != null && state.books!.isNotEmpty
                      ? Padding(
                          padding:
                              EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
                          child: Column(
                            children: [
                              const SearchComponent(),
                              Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: Text(
                                      LocaleKeys.countOfTotalContent.locale
                                          .replaceAll("{COUNT}",
                                              state.books!.length.toString()),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: ListView.separated(
                                      itemCount: state.books!.length,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 2.h),
                                      itemBuilder: (context, index) => BookCard(
                                          book: state.books![index],
                                          cameFromHomePage: true)),
                                ),
                              )
                            ],
                          ),
                        )
                      : const AppStateWidget(
                          stateText: LocaleKeys.failure, useAtHome: true);
                }

                /// MARK: Loading State
                else if (state is Loading) {
                  return const AppStateWidget(
                      stateText: LocaleKeys.loading, useAtHome: true);
                }

                /// MARK: Initial State
                else if (state is Initial) {
                  return const AppStateWidget(
                      stateText: LocaleKeys.initialHomePage, useAtHome: true);
                }

                /// MARK: Failure State
                else {
                  return const AppStateWidget(
                      stateText: LocaleKeys.failure, useAtHome: true);
                }
              })),
        ),
      ),
    );
  }
}
