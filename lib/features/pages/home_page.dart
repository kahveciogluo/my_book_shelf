import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/core/app_colors.dart';
import 'package:my_book_shelf/core/app_images.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/features/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/features/pages/favorites_page.dart';
import 'package:my_book_shelf/features/widgets/book_card.dart';
import 'package:my_book_shelf/features/widgets/locale_text.dart';
import 'package:my_book_shelf/features/widgets/search_component.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBackground,
      child: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async =>
              context.read<BookBloc>().add(const SearchBooks('Özlem')),
          child: Scaffold(
              backgroundColor: AppColors.appBackground,
              appBar: AppBar(
                backgroundColor: AppColors.appBackground,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: IconButton(
                        onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FavoritesPage()),
                            ),
                        icon: Image.asset(AppImages.heart,
                            color: Colors.white,
                            height: 4.h,
                            fit: BoxFit.contain)),
                  )
                ],
              ),
              body: BlocBuilder<BookBloc, BookState>(
                  builder: (context, state) => Padding(
                      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
                      child: (state is FetchBooksSuccess)
                          ? Column(
                              children: [
                                const SearchComponent(),
                                Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: Text(
                                        LocaleKeys.countOfTotalContent.locale
                                            .replaceAll("{COUNT}",
                                                state.books.length.toString()),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold))),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 2.h),
                                    child: ListView.separated(
                                        itemCount: state.books.length,
                                        separatorBuilder: (context, index) =>
                                            SizedBox(height: 2.h),
                                        itemBuilder: (context, index) =>
                                            BookCard(book: state.books[index])),
                                  ),
                                )
                              ],
                            )
                          : (state is BookBlocLoading)
                              ? Column(
                                  children: [
                                    const SearchComponent(),
                                    Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: const LocaleText(
                                          text: LocaleKeys.loading,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                )
                              : (state is BookBlocInitial)
                                  ? Column(
                                      children: [
                                        const SearchComponent(),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: const LocaleText(
                                              text: LocaleKeys.initialHomePage,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    )
                                  : Column(
                                      children: [
                                        const SearchComponent(),
                                        Padding(
                                          padding: EdgeInsets.only(top: 20.h),
                                          child: const LocaleText(
                                              text: LocaleKeys.failure,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ],
                                    )))),
        ),
      ),
    );
  }
}
