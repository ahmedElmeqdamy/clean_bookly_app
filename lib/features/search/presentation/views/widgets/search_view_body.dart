import 'package:clean_bookly_code/features/search/presentation/views/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomTextFormField(hintText: 'search...',

    );
  }
}
