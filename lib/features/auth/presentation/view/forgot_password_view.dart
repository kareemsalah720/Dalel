import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widget/custom_forgot_password_form.dart';
import 'package:dalel/features/auth/presentation/widget/forgot_password_image.dart';
import 'package:dalel/features/auth/presentation/widget/forgot_password_sub_titl.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
            child: SizedBox(
          height: 108,
        )),
        SliverToBoxAdapter(
          child: WelcomTextWidget(text: AppStrings.forgotPassword),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 40,
        )),
        SliverToBoxAdapter(
          child: ForgotPasswordImage(),
        ),
        SliverToBoxAdapter(
            child: SizedBox(
          height: 24,
        )),
        SliverToBoxAdapter(
          child: ForgotPasswordSubTitle(),
        ),
        SliverToBoxAdapter(
          child: CustomForgotPasswordForm(),
        )
      ]),
    );
  }
}
