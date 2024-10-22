
import 'package:dalel/features/hoom/presentation/widget/custom_category_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryHorizontalListView extends StatelessWidget {
  const CustomCategoryHorizontalListView({super.key,});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      
      height: 133,
     
      child: ListView.separated(
        clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          itemCount:6,
          separatorBuilder: (context, index) => const SizedBox(
            width: 16,
          ),
          itemBuilder: (context, index) {
            return const CustomCategoryListViewItem();
          }),
    );
  }
}
