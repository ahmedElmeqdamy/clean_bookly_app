import 'package:clean_bookly_code/core/utliti/simple_bloc_observer.dart';
import 'package:clean_bookly_code/features/home/data/repos/home_impl_repo.dart';
import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';

import 'package:clean_bookly_code/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:clean_bookly_code/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/fetch_books_cubit/featured_books_cubit.dart';
import 'package:clean_bookly_code/features/home/presentation/manager/fetch_newest_books/fetch_newest_books_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'core/utliti/routes.dart';
import 'core/utliti/setup_services_locator.dart';

void main() async {
  // we should put the following before run app
  // 1-install hive package
  await Hive.initFlutter();
  setupServicesLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>('featured_box');
  await Hive.openBox<BookEntity>('newest_box');
  Bloc.observer = SimpleBlocObserver();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FeaturedBooksCubit(
                FetchFeaturedBooksUseCase(getIt.get<HomeReposImpl>()),
              )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (context) => NewestBooksCubit(
                FetchNewestBooksUseCase(getIt.get<HomeReposImpl>()),
              )..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff100B20),

          //google font style bta3o bya5od by default light mode 3shan kda ana 3mlt darkmode
          //google font hy3ml font ll app kolooooo
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),

        // theme: ThemeData().copyWith(scaffoldBackgroundColor: Color(0xff100B20)),
      ),
    );
  }
}
