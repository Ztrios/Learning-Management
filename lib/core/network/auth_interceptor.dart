import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:learning_management/core/constants/local_database_keys.dart';
import 'package:learning_management/features/auth/domain/entities/sign_in_entity.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final box = Hive.box(LocalDatabaseKeys.database);
    String? data = box.get(LocalDatabaseKeys.student);
    if(data != null){
      SignInEntity signInEntity = SignInEntity.fromRawJson(data);
      if (signInEntity.signInData?.token != null) {
        options.headers["Authorization"] = "Bearer ${signInEntity.signInData?.token}";
      }
    }
    return handler.next(options);
  }
}