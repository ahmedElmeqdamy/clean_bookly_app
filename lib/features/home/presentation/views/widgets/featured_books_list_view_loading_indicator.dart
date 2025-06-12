import 'package:clean_bookly_code/core/utliti/custom_fading_widget.dart';
import 'package:flutter/material.dart';


import 'custom_image_loading_indicator.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.20,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 15,
          itemBuilder:
              (context, index) => Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 20),
            child: CustomImageLoadingIndicator(),
          ),
        ),
      ),
    );
  }
}
