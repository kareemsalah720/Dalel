import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/widget/custom_sign_up_form.dart';
import 'package:dalel/features/auth/presentation/widget/have_an_account_widget.dart';
import 'package:dalel/features/auth/presentation/widget/welcome_text_widget.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 152,
              ),
            ),
            SliverToBoxAdapter(
              child: WelcomTextWidget(text: AppStrings.welcome),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: CustomSignUpForm(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: HaveAnAccountWidget(
                text1: AppStrings.alreadyHaveAnAccount,
                text2: AppStrings.signIn,
              ),
            )
          ],
        ),
      ),
    );
  }
}
