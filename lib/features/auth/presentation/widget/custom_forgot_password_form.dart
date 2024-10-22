import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomForgotPasswordForm extends StatelessWidget {
  const CustomForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToast('Check your email to reset your password');
          customReplacementNavigate(context, '/signIn');
        } else if (state is ResetPasswordFailuerState) {
          showToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authcubit = BlocProvider.of<AuthCubit>(context);

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: authcubit.forgotPasswordFormKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    labelText: AppStrings.emailAddress,
                    onChanged: (emailAddress) {
                      authcubit.emailAddress = emailAddress;
                    },
                  ),
                  const SizedBox(
                    height: 129,
                  ),
                  state is ResetPasswordLoadingState
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : CustomBtn(
                          text: AppStrings.sendResetPasswordLink,
                          onPressed: () async {
                            if (authcubit.forgotPasswordFormKey.currentState!
                                .validate()) {
                              await authcubit.resetPasswordWithEmail();
                            }
                          }),
                ],
              )),
        );
      },
    );
  }
}
