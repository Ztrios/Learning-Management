import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/core/services/firebase_services/push_notification/push_notification_service.dart';
import 'package:learning_management/features/authentication/data/datasource/local_datasource/authentication_local_datasource.dart';
import 'package:learning_management/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:learning_management/features/authentication/domain/repositories/authentication_repositories.dart';
import 'package:learning_management/features/authentication/domain/usecases/sign_in_usecase.dart';
import 'package:learning_management/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:learning_management/features/home/data/datasource/remote_datasource/home_remote_datasource.dart';
import 'package:learning_management/features/home/data/repositories/home_repositories_impl.dart';
import 'package:learning_management/features/home/domain/repositories/home_repositories.dart';
import 'package:learning_management/features/lessons/data/datasource/remote_datasource/lessions_remote_datasouce.dart';
import 'package:learning_management/features/lessons/data/repositories/lessions_repositories_impl.dart';
import 'package:learning_management/features/lessons/domain/repositories/lessions_repositories.dart';
import 'package:learning_management/features/notifications/data/datasource/remote_datasource/notifications_remote_datasource.dart';
import 'package:learning_management/features/notifications/data/repositories/notifications_repositories_impl.dart';
import 'package:learning_management/features/notifications/domain/usecases/notifications_usecases.dart';
import 'package:learning_management/features/payments/data/datasource/remote_datasource/payments_remote_datasource.dart';
import 'package:learning_management/features/payments/data/repositories/payments_repositories_impl.dart';
import 'package:learning_management/features/payments/domain/repositories/payments_repositories.dart';
import 'package:learning_management/features/profile/data/datasource/remote_datasource/profile_remote_datasource.dart';
import 'package:learning_management/features/profile/data/repositories/profile_repositories_impl.dart';
import 'package:learning_management/features/profile/domain/repositories/profile_repositories.dart';
import 'package:learning_management/features/progress/data/datasource/remote_datasource/progress_remote_datasource.dart';
import 'package:learning_management/features/progress/data/repositories/progress_repositories_impl.dart';
import 'package:learning_management/features/progress/domain/repositories/progress_repositories.dart';
import 'package:learning_management/features/results/data/datasource/remote_datasource/results_remote_datasource.dart';
import 'package:learning_management/features/results/data/repositories/results_repositories_impl.dart';
import 'package:learning_management/features/results/domain/repositories/results_repositories.dart';
import 'package:learning_management/features/routine/data/datasource/remote_datasource/routine_remote_datasource.dart';
import 'package:learning_management/features/routine/data/repositories/routine_repositories_impl.dart';
import 'package:learning_management/features/routine/domain/repositories/routine_repositories.dart';

final sl = GetIt.instance;

void initServiceLocator(){

  sl.registerSingleton<DioClient>(DioClient());
  sl.registerSingleton<InternetConnectionChecker>(InternetConnectionChecker.instance);
  sl.registerSingleton<PushNotificationService>(PushNotificationServiceImpl());

  /// Remote Services
  sl.registerLazySingleton<AuthenticationLocalDatasource>(()=>AuthenticationLocalDatasourceImpl());
  sl.registerLazySingleton<HomeRemoteDataSource>(()=>HomeRemoteDataSourceImpl());
  sl.registerLazySingleton<LessionsRemoteDataSource>(()=>LessionsRemoteDataSourceImpl());
  sl.registerLazySingleton<NotificationsRemoteDatasource>(()=>NotificationsRemoteDatasourceImpl());
  sl.registerLazySingleton<PaymentsRemoteDatasource>(()=>PaymentsRemoteDatasourceImpl());
  sl.registerLazySingleton<ProfileRemoteDatasource>(()=>ProfileRemoteDatasourceImpl());
  sl.registerLazySingleton<ProgressRemoteDataSource>(()=>ProgressRemoteDatasourceImpl());
  sl.registerLazySingleton<ResultsRemoteDatasource>(()=>ResultsRemoteDatasourceImpl());
  sl.registerLazySingleton<RoutineRemoteDatasource>(()=>RoutineRemoteDatasourceImpl());


  /// Local Services
  sl.registerSingleton<AuthenticationLocalDatasource>(AuthenticationLocalDatasourceImpl());


  /// Repositories
  sl.registerSingleton<AuthenticationRepositories>(AuthenticationRepositoryIml());
  sl.registerSingleton<HomeRepositories>(HomeRepositoriesImpl());
  sl.registerSingleton<LessionsRepositories>(LessionsRepositoriesImpl());
  sl.registerSingleton<NotificationsRepositories>(NotificationsRepositoriesImpl());
  sl.registerSingleton<PaymentsRepositories>(PaymentsRepositoriesImpl());
  sl.registerSingleton<ProfileRepositories>(ProfileRepositoriesImpl());
  sl.registerSingleton<ProgressRepositories>(ProgressRepositoriesImpl());
  sl.registerSingleton<ResultsRepositories>(ResultsRepositoriesImpl());
  sl.registerSingleton<RoutineRepositories>(RoutineRepositoriesImpl());



  /// UseCases
  /// Authentication UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());


}