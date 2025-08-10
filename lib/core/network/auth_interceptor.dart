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

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var result = await sl<GetSignInEntityUseCase>().call();
    result.map((signInEntity) {
      if (signInEntity != null) {
        if (signInEntity.signInData?.token != null) {
          options.headers["Authorization"] =
          "Bearer ${signInEntity.signInData?.token}";
        }
      }
    });
    return handler.next(options);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if(err.response?.statusCode == 401){

      var result = await sl<GetSignInEntityUseCase>().call();

      result.map((signInEntity) async {
        if (signInEntity?.signInData?.refreshToken != null) {
          String refreshToken = signInEntity!.signInData!.refreshToken!;

          if(!isRefreshing){
            isRefreshing = true;

            Map<String, dynamic> body = {"refreshToken" : refreshToken};

            var refreshResult = await sl<RefreshTokenUseCase>().call(params: body);

            refreshResult.fold(
                    (_) async {
                        queuedRequests.clear();
                        navigatorKey.currentState?.context.goNamed(SignInPage.path);
                        await sl<SignOutUseCase>().call();
                        return handler.reject(err);
                    },
                    (signInEntity) async {

                        await sl<SaveSignInEntityUseCase>().call(params: signInEntity);
                        String? newToken = signInEntity.signInData?.token;

                        Dio dio = Dio();

                        // Retry queued requests
                        for (var request in queuedRequests) {
                          request.headers["Authorization"] = "Bearer $newToken";
                          handler.resolve(await dio.fetch(request));
                        }
                        queuedRequests.clear();

                        err.requestOptions.headers["Authorization"] =
                        "Bearer $newToken";
                        Response response = await dio.fetch(err.requestOptions);
                        isRefreshing = false;
                        return handler.resolve(response);

                    }
            );

          }else{
            queuedRequests.add(err.requestOptions);
          }

        }else{
          queuedRequests.clear();
          navigatorKey.currentState?.context.goNamed(SignInPage.path);
          await sl<SignOutUseCase>().call();
          return handler.reject(err);
        }
      });
    }
    return handler.next(err);
  }


}