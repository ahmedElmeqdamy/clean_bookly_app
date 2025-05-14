import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utliti/styles.dart';
import 'book_rating.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context).push('/BookDetailsView');
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),

                child: Image.asset('assets/images/1.jpg', fit: BoxFit.fill),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: Text(
                      'GITMO AND BACK AGAIN AND SAY AGAIN',
                      style: Styles.textStyle21,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('J.K HARRY potter', style: Styles.textStyle14),
                  SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        '19.99 LE',
                        style: Styles.textStyle21.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      BookRating(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
