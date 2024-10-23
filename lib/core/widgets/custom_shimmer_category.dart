import 'package:dalel/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerCategory extends StatelessWidget {
  const CustomShimmerCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 155,
          height: 96,
          child: Shimmer.fromColors(
              baseColor: AppColors.Grey,
              highlightColor: Colors.white,
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.Grey,
                    borderRadius: BorderRadius.circular(5),
                  ))),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width:155,
          height: 96,
          child: Shimmer.fromColors(
              baseColor: AppColors.Grey,
              highlightColor: Colors.white,
              child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: AppColors.Grey,
                    borderRadius: BorderRadius.circular(5),
                  ))),
        ),
      ],
    );
  }
}
