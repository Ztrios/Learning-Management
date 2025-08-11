import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:learning_management/config/routes/app_routes.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/local_database_keys.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';
import 'package:learning_management/features/auth/domain/usecases/get_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/save_signin_entity_usecase.dart';
import 'package:learning_management/features/auth/domain/usecases/sign_out_usecase.dart';
import 'package:learning_management/features/auth/presentation/pages/sign_in_page.dart';


class AuthInterceptor extends Interceptor {
  bool isRefreshing = false;
  final List<RequestOptions> queuedRequests = [];
  final Dio dio;

  AuthInterceptor({required this.dio});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var result = await sl<GetSignInEntityUseCase>().call();
    result.map((signInEntity) {
      if (signInEntity?.signInData?.token != null) {
        options.headers["Authorization"] = "Bearer ${signInEntity!.signInData!.token}";
      }
    });
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      var result = await sl<GetSignInEntityUseCase>().call();

      return result.fold(
            (failure) async {
          await _forceSignOut();
          return handler.reject(err);
        },
            (signInEntity) async {
          if (signInEntity?.signInData?.refreshToken == null) {
            await _forceSignOut();
            return handler.reject(err);
          }

          String refreshToken = signInEntity!.signInData!.refreshToken!;

          // If already refreshing, queue the request
          if (isRefreshing) {
            queuedRequests.add(err.requestOptions);
            return;
          }

          isRefreshing = true;

          Map<String, dynamic> body = {"refreshToken": refreshToken};
          var refreshResult = await sl<RefreshTokenUseCase>().call(params: body);

          return refreshResult.fold(
                (failure) async {
              await _forceSignOut();
              isRefreshing = false;
              return handler.reject(err);
            },
                (newSignInEntity) async {
              await sl<SaveSignInEntityUseCase>().call(params: newSignInEntity);
              String? newToken = newSignInEntity.signInData?.token;

              // Retry queued requests
              for (var request in queuedRequests) {
                request.headers["Authorization"] = "Bearer $newToken";
                dio.fetch(request);
              }
              queuedRequests.clear();

              // Retry original failed request
              err.requestOptions.headers["Authorization"] = "Bearer $newToken";
              Response response = await dio.fetch(err.requestOptions);

              isRefreshing = false;
              return handler.resolve(response);
            },
          );
        },
      );
    }

    handler.next(err); // non-401 errors
  }

  Future<void> _forceSignOut() async {
    queuedRequests.clear();
    await sl<SignOutUseCase>().call();
    navigatorKey.currentContext?.goNamed(SignInPage.name);
  }
}

