import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utliti/styles.dart';
class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating});
final num rating;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,),
        SizedBox(width: 6.3,),
        Text('$rating',style: Styles.textStyle16),
        SizedBox(width: 6.3,),
        Text('(8200)',style: Styles.textStyle14,),
      ],
    );
  }
}
