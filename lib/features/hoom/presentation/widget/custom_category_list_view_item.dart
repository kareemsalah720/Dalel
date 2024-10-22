import 'package:dalel/core/utils/app_assets.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';


class CustomCategoryListViewItem extends StatelessWidget {
  const CustomCategoryListViewItem(
      {super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 74,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.5),
              blurRadius: 10,
              offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(children: [
        Container(
          height: 96,
          width: 74,
          decoration: const BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              image:
                  DecorationImage(image: AssetImage(Assets.imagesFrame28), fit: BoxFit.fill)),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          'Lionheart',
          style: CustomTextStyles.poppins500style18
              .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    );
  }
}
