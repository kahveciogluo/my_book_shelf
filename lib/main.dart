import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_shelf/core/app_config.dart';
import 'package:my_book_shelf/features/data/database/database.dart';
import 'package:my_book_shelf/features/domain/repositories/book_repository.dart';
import 'package:my_book_shelf/features/presentation/blocs/book/book_bloc.dart';
import 'package:my_book_shelf/features/presentation/pages/home_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Database.init();
  BookRepository.init();

  runApp(EasyLocalization(
      path: AppConfig.langPath,
      supportedLocales: const [AppConfig.trLocale, AppConfig.enLocale],
      fallbackLocale: AppConfig.enLocale,
      child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => BookBloc())],
      child: ResponsiveSizer(
          builder: (p0, p1, p2) => MaterialApp(
                theme: ThemeData(fontFamily: AppConfig.appFontFamily),
                locale: Locale(Platform.localeName.split("_").first,
                    Platform.localeName.split("_").last),
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                home: const HomePage(),
              )),
    );
  }
}
