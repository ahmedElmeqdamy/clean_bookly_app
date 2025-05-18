import 'package:clean_bookly_code/core/utliti/styles.dart';
import 'package:clean_bookly_code/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:clean_bookly_code/features/search/presentation/views/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(hintText: 'search...'),
          Text(
            'Results',
            style: Styles.textStyle21.copyWith(fontFamily: 'Gt Sectra Fine'),
          ),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
