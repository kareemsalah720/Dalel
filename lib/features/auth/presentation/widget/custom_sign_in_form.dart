import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_button.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widget/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widget/forgot_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class custom_sign_In_form extends StatelessWidget {
  const custom_sign_In_form({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
          if (state is SigninSuccessState) {
        
           FirebaseAuth.instance.currentUser!.emailVerified? 
          customReplacementNavigate(context, '/HoomNavBar'):ShowToast('Please Verify Your Account');
        } else if (state is SigninFailuerState) {
          ShowToast(state.errorMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authcubit = BlocProvider.of<AuthCubit>(context);

        return Form(
            key: authcubit.sgininFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (emailAddress) {
                    authcubit.emailAddress = emailAddress;
                  },
                ),
                CustomTextFormField(
                  labelText: AppStrings.password,
                  obscureText: authcubit.obsecureText!,
                  suffixIcon: IconButton(
                      onPressed: () {
                        authcubit.updateObsecureText();
                      },
                      icon: Icon(authcubit.obsecureText!
                          ? Icons.visibility_off
                          : Icons.visibility)),
                  onChanged: (password) {
                    authcubit.password = password;
                  },
                ),
                  const SizedBox(
                  height: 16,
                ),
            const    ForgotPasswordTextWidget(),
                const SizedBox(
                  height: 102,
                ),
                state is SigninLoadingState
                    ? CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      )
                    : CustomBtn(
                        text: AppStrings.signIn,
                        onPressed: () async {
                          if (authcubit.sgininFormKey.currentState!
                              .validate()) {
                            await authcubit.signInWithEmailAndPassword();
                          } 
                        }),
              ],
            ));
      },
    );
  }
}
