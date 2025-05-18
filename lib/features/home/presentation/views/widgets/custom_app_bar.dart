import 'package:clean_bookly_code/core/utliti/routes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo.png', height: 20, ),
          IconButton(

            onPressed: () {
              GoRouter.of(context).push('/SearchView');
            },
            icon: Icon(FontAwesomeIcons.magnifyingGlass,size: 24,),
          ),
        ],
      ),
    );
  }
}
