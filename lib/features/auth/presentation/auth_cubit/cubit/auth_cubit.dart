import 'dart:math';

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
  GlobalKey<FormState> sginUpFormKey = GlobalKey();
  bool? termsAndConditionsCheckBoxValue=false;

  CreateUserWithEmailAndPassword() async {
    try {
      emit(SignupLoadingState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignupSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignupFailuerState(
            errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignupFailuerState(
            errorMessage: 'The account already exists for that email.'));
      }
    } catch (e) {
      emit(SignupFailuerState(errorMessage: e.toString()));
    }
  }

  UpdateTermsAndConditionsCheckBox({required newValue}) {
    termsAndConditionsCheckBoxValue = newValue;
    emit(TermsAndConditionsUpdateState());
  }
}
