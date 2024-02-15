import 'package:flutter/material.dart';
import 'package:my_book_shelf/features/widgets/locale_text.dart';
import 'package:my_book_shelf/features/search/search_component.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppStateWidget extends StatelessWidget {
  final String stateText;
  final bool? useAtHome;
  const AppStateWidget(
      {super.key, required this.stateText, this.useAtHome = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 3.w, right: 3.w, top: 1.h),
      child: Column(
        children: [
          if (useAtHome!) const SearchComponent(),
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: LocaleText(
                        text: stateText,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 20.h)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
