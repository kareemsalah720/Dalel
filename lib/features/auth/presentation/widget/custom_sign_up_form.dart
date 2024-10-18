import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widget/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.sginUpFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (fristName) {
                  authCubit.fristName = fristName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastName) {
                  authCubit.lastName = lastName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  authCubit.emailAddress = emailAddress;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const TermsAndCondition(),
              const SizedBox(
                height: 88,
              ),
              CustomBtn(
                color: authCubit.termsAndConditionsCheckBoxValue == false?AppColors.Grey:null,
                text: AppStrings.signUp,
                onPressed: () {
                  if (authCubit.termsAndConditionsCheckBoxValue == true) {
                    if (authCubit.sginUpFormKey.currentState!.validate()) {
                      authCubit.CreateUserWithEmailAndPassword();
                    }
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
