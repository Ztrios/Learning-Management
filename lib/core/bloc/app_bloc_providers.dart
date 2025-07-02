import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  const AppBlocProviders._();

  /// All Bloc Providers are created here
  static List<BlocProvider> get providers => [
    //BlocProvider<InternetConnectivityCubit>(create: (context)=> InternetConnectivityCubit()..connectivityChecker()),
    //BlocProvider<OnboardingBloc>(create: (context)=> OnboardingBloc()..add(GetOnboardData())),
  ];
}
