import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:dalel/features/hoom/data/model/historical_periods_model.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsItem extends StatelessWidget {
  const HistoricalPeriodsItem({super.key, required this.model});
final  HistoricalPeriodsModel model;
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
            model.name,
            style: CustomTextStyles.poppins500style18
                .copyWith(color: AppColors.deepBrown, fontSize: 16),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Container(
          height: 64,
          width: 47,
          decoration:  BoxDecoration(
              image: DecorationImage(image: NetworkImage(model.image))),
        ),
        const SizedBox(
          width: 16,
        ),
      ]),
    );
  }
}
