import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_book_shelf/core/app_images.dart';
import 'package:my_book_shelf/models/book_entity.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BookCard extends StatelessWidget {
  final BookEntity book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 6.sp),
          borderRadius: BorderRadius.all(Radius.circular(15.sp))),
      child: Row(
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
                                image: imageProvider, fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(5.sp)),
                      ),
                  progressIndicatorBuilder: (context, url, progress) =>
                      const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                  errorWidget: (context, url, error) => const SizedBox.shrink())
              : Container(
                  width: 25.w,
                  height: 20.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.sp)),
                  child: Image.asset(AppImages.books, fit: BoxFit.contain),
                )
        ],
      ),
    );
  }
}
