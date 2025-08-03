import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:learning_management/features/auth/presentation/bloc/auth_event.dart';
import 'package:learning_management/features/home/presentation/bloc/home_bloc.dart';
import 'package:learning_management/features/subject_details/presentation/bloc/subject_details_bloc.dart';
import 'package:learning_management/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:learning_management/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:learning_management/features/payments/presentation/bloc/payment_bloc.dart';
import 'package:learning_management/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:learning_management/features/progress/presentation/bloc/progress_bloc.dart';
import 'package:learning_management/features/results/presentation/bloc/results_bloc.dart';
import 'package:learning_management/features/routine/presentation/bloc/routine_bloc.dart';

class AppBlocProviders {
  const AppBlocProviders._();

  /// All Bloc Providers are created here
  static List<BlocProvider> get providers => [
    //BlocProvider<InternetConnectivityCubit>(create: (context)=> InternetConnectivityCubit()..connectivityChecker()),
    BlocProvider<OnboardingCubit>(create: (context)=> OnboardingCubit()..userAlreadyOnboarded()),
    BlocProvider<AuthBloc>(create: (context)=> AuthBloc()..add(GetSignInEntity())),
    BlocProvider<HomeBloc>(create: (context)=> HomeBloc()),
    BlocProvider<SubjectDetailsBloc>(create: (context)=> SubjectDetailsBloc()),
    BlocProvider<RoutineBloc>(create: (context)=> RoutineBloc()),
    BlocProvider<ProgressBloc>(create: (context)=> ProgressBloc()),
    BlocProvider<ResultsBloc>(create: (context)=> ResultsBloc()),
    BlocProvider<NotificationsBloc>(create: (context)=> NotificationsBloc()),
    BlocProvider<PaymentBloc>(create: (context)=> PaymentBloc()),
    BlocProvider<ProfileBloc>(create: (context)=> ProfileBloc()),
  ];
}
