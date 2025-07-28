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

class SplashPage extends StatelessWidget {
  static String get path => "/";
  static String get name => "splash";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current)=> current.signInEntity == null || current.signInEntity != null,
      listener: (context, state){
        if(state.signInStatus.isSuccess && state.signInEntity != null){
          context.go(HomePage.path);
        }else{
          context.go(SignInPage.path);
        }
        FlutterNativeSplash.remove();
      },
      child: Scaffold(
        body: SizedBox.shrink(),
      )
    );
  }
}
