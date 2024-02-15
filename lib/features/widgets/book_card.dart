import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/core/app_images.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/database/database.dart';
import 'package:my_book_shelf/features/widgets/app_snackbar.dart';
import 'package:my_book_shelf/models/book_entity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookCard extends StatefulWidget {
  final BookEntity book;
  final bool cameFromHomePage;
  const BookCard(
      {super.key, required this.book, this.cameFromHomePage = false});

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
        builder: (context, state) => GestureDetector(
              onDoubleTap: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                if (widget.cameFromHomePage &&
                    !Database.getFavoritesFromDatabase()
                        .values
                        .contains(widget.book)) {
                  context.read<BookBloc>().add(AddBookToFavorites(widget.book));
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                      AppSnackBar.snackBar(
                          message: LocaleKeys
                              .yourSelectionHasBeenAddedToFavorites.locale));
                }
              },
              onLongPress: () {
                if (Database.getFavoritesFromDatabase()
                    .values
                    .contains(widget.book)) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  widget.cameFromHomePage
                      ? context
                          .read<BookBloc>()
                          .add(DeleteBookFromHomePage(widget.book))
                      : context
                          .read<BookBloc>()
                          .add(DeleteBookFromFavoritesPage(widget.book));
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                      AppSnackBar.snackBar(
                          message: LocaleKeys
                              .yourSelectionHasBeenRemovedFromFavorites
                              .locale));
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: widget.cameFromHomePage &&
                                Database.getFavoritesFromDatabase()
                                    .values
                                    .contains(widget.book)
                            ? Colors.blueAccent
                            : Colors.white.withOpacity(0.3),
                        width: 6.sp),
                    borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// MARK: Görsel
                    widget.book.volumeInfo?.imageLinks?.smallThumbnail != null
                        ? CachedNetworkImage(
                            imageUrl: widget
                                .book.volumeInfo!.imageLinks!.smallThumbnail!,
                            imageBuilder: (context, imageProvider) => Container(
                                  width: 25.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.fitHeight),
                                      borderRadius:
                                          BorderRadius.circular(5.sp)),
                                ),
                            progressIndicatorBuilder:
                                (context, url, progress) => const Center(
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    ),
                            errorWidget: (context, url, error) =>
                                const SizedBox.shrink())
                        : Container(
                            width: 25.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.sp)),
                            child: Image.asset(AppImages.books,
                                fit: BoxFit.contain),
                          ),
                    SizedBox(width: 1.w),

                    /// MARK: Textler
                    SizedBox(
                      width: 55.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// MARK: Title
                          Text(
                            widget.book.volumeInfo!.title ??
                                LocaleKeys.unknown.locale,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600),
                          ),

                          /// MARK: Divider
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 0.3.h),
                            child: Divider(
                              thickness: 0.2.h,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),

                          /// MARK: Subtitle
                          if (widget.book.volumeInfo!.subtitle != null)
                            Text(
                              '${LocaleKeys.explanation.locale}: ${widget.book.volumeInfo!.subtitle!}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),

                          /// MARK: Authors
                          if (widget.book.volumeInfo!.authors != null &&
                              widget.book.volumeInfo!.authors!.isNotEmpty)
                            Padding(
                              padding: EdgeInsets.only(top: 0.3.h),
                              child:
                                  widget.book.volumeInfo!.authors!.length == 1
                                      ? Text(
                                          '${LocaleKeys.author.locale}: ${widget.book.volumeInfo!.authors!.first}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        )
                                      : Text(
                                          '${LocaleKeys.authors.locale}: ${widget.book.volumeInfo!.authors!}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                            ),

                          /// MARK: Publisher
                          if (widget.book.volumeInfo!.publisher != null)
                            Padding(
                              padding: EdgeInsets.only(top: 0.3.h),
                              child: Text(
                                '${LocaleKeys.publisher.locale}: ${widget.book.volumeInfo!.publisher!}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                          /// MARK: Published Date
                          if (widget.book.volumeInfo!.publishedDate != null)
                            Padding(
                              padding: EdgeInsets.only(top: 0.3.h),
                              child: Text(
                                '${LocaleKeys.publishedDate.locale}: ${widget.book.volumeInfo!.publishedDate!}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),

                          /// MARK: Page Count
                          if (widget.book.volumeInfo!.pageCount != null &&
                              widget.book.volumeInfo!.pageCount! > 0)
                            Padding(
                                padding: EdgeInsets.only(top: 0.3.h),
                                child: Text(
                                  '${LocaleKeys.pageCount.locale}: ${widget.book.volumeInfo!.pageCount!.toString()}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
