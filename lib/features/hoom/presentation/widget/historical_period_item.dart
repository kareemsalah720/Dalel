import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsItem extends StatelessWidget {
  const HistoricalPeriodsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: 155,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 3),
            )
          ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const SizedBox(
          width: 16,
        ),
        SizedBox(
          height: 48,
          width: 63,
          child: Text(
            'Anicent Egypt',
            style: CustomTextStyles.poppins500style18
                .copyWith(color: AppColors.deepBrown, fontSize: 16),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Container(
          height: 64,
          width: 47,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Assets.imagesFrame27))),
        ),
        const SizedBox(
          width: 16,
        ),
      ]),
    );
  }
}