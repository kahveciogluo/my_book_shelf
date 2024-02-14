import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/features/widgets/locale_text.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchComponent extends StatefulWidget {
  const SearchComponent({super.key});

  @override
  State<SearchComponent> createState() => _SearchComponentState();
}

class _SearchComponentState extends State<SearchComponent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// MARK: Serch Box
        Container(
          width: 70.w,
          height: 8.h,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black26, width: 6.sp),
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: const Row(children: [Icon(Icons.search)]),
          ),
        ),

        /// MARK: Search Button
        Container(
          width: 20.w,
          height: 6.h,
          decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(15.sp))),
          child: const Center(
              child: LocaleText(
            text: LocaleKeys.search,
            style: TextStyle(color: Colors.white),
          )),
        )
      ],
    );
  }
}
