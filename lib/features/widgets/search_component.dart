// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/core/search_action.dart';
import 'package:my_book_shelf/features/widgets/app_snackbar.dart';
import 'package:my_book_shelf/features/widgets/locale_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final searchAction = SearchAction(duration: const Duration(seconds: 1));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// MARK: Serch Bar
        Container(
          width: 70.w,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 6.sp),
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: TextField(
              controller: searchController,
              onChanged: (value) {
                searchAction.run(() {
                  if (searchController.text.trim().isNotEmpty) {
                    if (searchController.text.trim().length < 500) {
                      context
                          .read<BookBloc>()
                          .add(SearchBooks(searchController.text));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          AppSnackBar.snackBar(
                              message: LocaleKeys.invalidSearch.locale));
                    }
                  }
                });
              },
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: null,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                icon: Icon(Icons.search, color: Colors.white),
                border: InputBorder.none,
              )),
        ),

        /// MARK: Search Button
        GestureDetector(
          onTap: () {
            if (searchController.text.trim().isNotEmpty)
              context.read<BookBloc>().add(SearchBooks(searchController.text));
          },
          child: Container(
            width: 20.w,
            height: 6.h,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.sp))),
            child: const Center(
                child: LocaleText(
              text: LocaleKeys.search,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}
