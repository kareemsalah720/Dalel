import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widget/custom_sign_in_form.dart';
import 'package:dalel/features/auth/presentation/widget/custom_welcom_banner.dart';
import 'package:dalel/features/auth/presentation/widget/have_an_account_widget.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
        const SliverToBoxAdapter(
          child: WelcomBanner(),
        ),
        const SliverToBoxAdapter(
            child: SizedBox(
          height: 32,
        )),
        const SliverToBoxAdapter(
          child: WelcomTextWidget(text: 'Welcome Back'),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: custom_sign_In_form(),
          ),
        ),
          const SliverToBoxAdapter(
            child: SizedBox(
          height: 16,
        )),
        SliverToBoxAdapter(
          child: HaveAnAccountWidget(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () {
                customReplacementNavigate(context, '/signUp');
              }),
        ),
          const SliverToBoxAdapter(
            child: SizedBox(
          height: 16,
        )),
      ]),
    );
  }
}
