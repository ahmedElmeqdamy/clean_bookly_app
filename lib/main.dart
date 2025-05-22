import 'package:clean_bookly_code/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

import 'core/utliti/routes.dart';



void main() async{
  runApp(const BooklyApp());
// install hive package
  Hive.registerAdapter(BookEntityAdapter());
 await Hive.openBox('featured_box');

}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff100B20),

        //google font style bta3o bya5od by default light mode 3shan kda ana 3mlt darkmode
       //google font hy3ml font ll app kolooooo
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),


      // theme: ThemeData().copyWith(scaffoldBackgroundColor: Color(0xff100B20)),
    );
  }
}
