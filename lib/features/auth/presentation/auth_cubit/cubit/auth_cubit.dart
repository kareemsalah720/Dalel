import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? fristName;
  String? lastName;
  String? emailAddress;
  String? password;
  GlobalKey<FormState> sginupFormKey = GlobalKey();
  GlobalKey<FormState> sgininFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();
  bool? termsAndConditionsCheckBoxValue = false;
  bool obsecureText = true;
  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      verifyEmail();
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailuerState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailuerState(
            errorMessage: 'The account already exists for that email.'));
      } else if (e.code == 'invalid-email') {
        emit(SignupFailuerState(errorMessage: 'The email is invalid'));
      } else {
        emit(SignupFailuerState(errorMessage: e.code));
      }
    } catch (e) {
      emit(SignupFailuerState(errorMessage: e.toString()));
    }
  }

  verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  UpdateTermsAndConditionsCheckBox({required newValue}) {
    termsAndConditionsCheckBoxValue = newValue;
    emit(TermsAndConditionsUpdateState());
  }

  UpdateObsecureText() {
    obsecureText = !obsecureText;
    emit(ObsecureTextUpdateState());
  }

  signInWithEmailAndPassword() async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress!, password: password!);

      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailuerState(errorMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SigninFailuerState(
            errorMessage: 'Wrong password provided for that user.'));
      } else {
        emit(SigninFailuerState(errorMessage: 'Check your Email and Password'));
      }
    } catch (e) {
      emit(SigninFailuerState(errorMessage: e.toString()));
    }
  }

  resetPasswordWithEmail() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } on FirebaseAuthException catch (e) {
      emit(ResetPasswordFailuerState(errorMessage: e.code));
    } catch (e) {
      emit(ResetPasswordFailuerState(errorMessage: e.toString()));
    }
  }
}

