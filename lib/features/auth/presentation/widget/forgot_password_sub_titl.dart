import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class ForgotPasswordSubTitle extends StatelessWidget {
  const ForgotPasswordSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        AppStrings.forgotPasswordSubTitel,
        style: CustomTextStyles.poppins400style12.copyWith(fontSize: 14),
        textAlign: TextAlign.center,
      ),
    );
  }
}
