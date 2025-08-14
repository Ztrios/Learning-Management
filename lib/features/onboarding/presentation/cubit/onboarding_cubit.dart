import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/features/onboarding/domain/usecases/already_onboarded_usecase.dart';
import 'package:learning_management/features/onboarding/domain/usecases/user_onboarded_usecase.dart';

class OnboardingCubit extends Cubit<bool>{
  OnboardingCubit(): super(false);

  Future<void> userIsOnboarded() async {
    var result = await sl<UserOnboardedUseCase>().call();
    result.fold(
            (error)=> emit(false),
            (data)=> emit(data)
    );
  }


  Future<void> userAlreadyOnboarded() async {
    var result = await sl<AlreadyOnboardedUseCase>().call();
    result.fold(
            (error)=> emit(false),
            (data)=> emit(data)
    );
  }


}