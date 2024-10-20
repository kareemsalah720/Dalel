import 'package:dalel/features/auth/presentation/auth_cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/view/forgot_password_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_in_view.dart';
import 'package:dalel/features/auth/presentation/view/sign_up_view.dart';
import 'package:dalel/features/hoom/presentation/view/hoom_view.dart';
import 'package:dalel/features/hoom/presentation/widget/hoom_nav_bar.dart';
import 'package:dalel/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:dalel/features/splash/presentation/views/splashview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(path: "/", builder: (context, state) => const Splashview()),
  GoRoute(
      path: "/onBoarding", builder: (context, state) => const OnBoardingView()),
  GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          )),
  GoRoute(
      path: "/signIn",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignInView(),
          )),
  GoRoute(
      path: "/forgotPassword",
      builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const ForgotPasswordView(),
          )),
  GoRoute(
      path: "/HoomNavBar",
      builder: (context, state) => const HoomNavBarWidget()),
]);
