import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/core/app_colors.dart';
import 'package:my_book_shelf/core/app_images.dart';
import 'package:my_book_shelf/features/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/features/widgets/book_card.dart';
import 'package:my_book_shelf/features/widgets/search_component.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBackground,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.appBackground,
          appBar: AppBar(
            backgroundColor: AppColors.appBackground,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: IconButton(
                    onPressed: () => context
                        .read<BookBloc>()
                        .add(const SearchBooks('Özlem')),
                    //  Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => const FavoritiesView()),
                    //     ),
                    icon: Image.asset(AppImages.heart,
                        color: Colors.white, height: 4.h, fit: BoxFit.contain)),
              )
            ],
          ),
          body: BlocBuilder<BookBloc, BookState>(
              builder: (context, state) => Padding(
                    padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
                    child: Column(
                      children: [
                        const SearchComponent(),
                        if (state is SearchBooksSuccess)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: ListView.separated(
                                  itemCount: state.bookList.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 2.h),
                                  itemBuilder: (context, index) =>
                                      BookCard(book: state.bookList[index])),
                            ),
                          ),
                      ],
                    ),
                  )),
        ),
      ),
    );
  }
}
