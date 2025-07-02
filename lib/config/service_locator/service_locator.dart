import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/core/services/firebase_services/push_notification/push_notification_service.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());
  //sl.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker.instance);
  //sl.registerSingleton<PushNotificationService>(PushNotificationServiceImpl());

  // /// Remote Services
  // sl.registerSingleton<HomeServices>(HomeServicesImpl());
  // sl.registerSingleton<RecipesService>(RecipesServiceImpl());
  //
  //
  // /// Local Services
  // sl.registerSingleton<OnboardingLocalServices>(OnboardingLocalServiceImpl());
  // sl.registerSingleton<SignUpLocalServices>(SignUpLocalServiceImpl());
  // sl.registerSingleton<CartsLocalServices>(CartsLocalServicesImpl());
  //
  //
  // /// Repositories
  // sl.registerSingleton<OnboardingRepository>(OnboardingRepositoryImpl());
  // sl.registerSingleton<HomeRepositories>(HomeRepositoryImpl());
  //
  //
  // /// UseCases
  // sl.registerSingleton<GetOnboardUseCase>(GetOnboardUseCase());
  // sl.registerSingleton<CategoriesUseCase>(CategoriesUseCase());


}