import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/app_images.dart';
import 'package:my_book_shelf/core/extension/string_extension.dart';
import 'package:my_book_shelf/core/lang/locale_keys.g.dart';
import 'package:my_book_shelf/models/book_entity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookCard extends StatelessWidget {
  final BookEntity book;
  final bool cameFromHomePage;
  const BookCard(
      {super.key, required this.book, this.cameFromHomePage = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        // Eğer kitap favori kitaplara ekli değilse eklenecek. Zaten favorilerde ise hiçbir şey olmayacak
        // Favorilere eklenince snackbar ile uyarı göster
      },
      onLongPress: () {
        // Eğer kitap favori kitaplardaysa, favori kitaplardan çıkartılacak. Zaten favorilerde değilse bir şey yapılmayacak
        // Favorilerden çıkartılınca snackbar ile uyarı göster
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        decoration: BoxDecoration(
            border:
                Border.all(color: Colors.white.withOpacity(0.3), width: 6.sp),
            borderRadius: BorderRadius.all(Radius.circular(15.sp))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// MARK: Görsel
            book.volumeInfo?.imageLinks?.smallThumbnail != null
                ? CachedNetworkImage(
                    imageUrl: book.volumeInfo!.imageLinks!.smallThumbnail!,
                    imageBuilder: (context, imageProvider) => Container(
                          width: 25.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.fitHeight),
                              borderRadius: BorderRadius.circular(5.sp)),
                        ),
                    progressIndicatorBuilder: (context, url, progress) =>
                        const Center(
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
                    child: Image.asset(AppImages.books, fit: BoxFit.contain),
                  ),
            SizedBox(width: 2.w),

            /// MARK: Textler
            SizedBox(
              width: 60.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// MARK: Title
                  Text(
                    book.volumeInfo!.title ?? LocaleKeys.unknown.locale,
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
                  if (book.volumeInfo!.subtitle != null)
                    Text(
                      '${LocaleKeys.explanation.locale}: ${book.volumeInfo!.subtitle!}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),

                  /// MARK: Authors
                  if (book.volumeInfo!.authors != null &&
                      book.volumeInfo!.authors!.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(top: 0.3.h),
                      child: book.volumeInfo!.authors!.length == 1
                          ? Text(
                              '${LocaleKeys.author.locale}: ${book.volumeInfo!.authors!.first}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          : Text(
                              '${LocaleKeys.authors.locale}: ${book.volumeInfo!.authors!}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                    ),

                  /// MARK: Publisher
                  if (book.volumeInfo!.publisher != null)
                    Padding(
                      padding: EdgeInsets.only(top: 0.3.h),
                      child: Text(
                        '${LocaleKeys.publisher.locale}: ${book.volumeInfo!.publisher!}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                  /// MARK: Published Date
                  if (book.volumeInfo!.publishedDate != null)
                    Padding(
                      padding: EdgeInsets.only(top: 0.3.h),
                      child: Text(
                        '${LocaleKeys.publishedDate.locale}: ${book.volumeInfo!.publishedDate!}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),

                  /// MARK: Page Count
                  if (book.volumeInfo!.pageCount != null &&
                      book.volumeInfo!.pageCount! > 0)
                    Padding(
                        padding: EdgeInsets.only(top: 0.3.h),
                        child: Text(
                          '${LocaleKeys.pageCount.locale}: ${book.volumeInfo!.pageCount!.toString()}',
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
    );
  }
}
