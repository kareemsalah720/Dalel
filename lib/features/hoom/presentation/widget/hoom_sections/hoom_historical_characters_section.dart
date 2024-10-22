import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_header_text.dart';
import 'package:dalel/features/hoom/presentation/widget/custom_category_list_view.dart';
import 'package:flutter/material.dart';

class HistoricalCharactersSection extends StatelessWidget {
  const HistoricalCharactersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
          text: AppStrings.historicalCharacters,
        ),
        SizedBox(
          height: 16,
        ),
        CustomCategoryHorizontalListView(),
        SizedBox(
          height: 32,
        ),
      ],
    );
  }
}