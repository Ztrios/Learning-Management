import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/utils/extensions/status_extension.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';
import 'package:learning_management/features/home/presentation/pages/home_page.dart';
import 'package:learning_management/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:learning_management/features/onboarding/presentation/pages/onboarding_page.dart';

class SplashPage extends HookWidget {
  static String get path => "/";
  static String get name => "splash";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    void checkingOnboard(){
      bool alreadyOnboarded = context.read<OnboardingCubit>().state;
      if(alreadyOnboarded){
        context.go(SignInPage.path);
      }else{
        context.go(OnboardingPage.path);
      }
    }


    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state){
        if(state.rememberUser){
          context.go(HomePage.path);
        }else{
          checkingOnboard();
        }
        FlutterNativeSplash.remove();
      },
      child: Scaffold(
        body: SizedBox.shrink(),
      )
    );
  }
}
