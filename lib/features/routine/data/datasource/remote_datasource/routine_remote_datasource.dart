import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/helpers/format_data/datetime_formatters.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/routine/data/models/class_routine_model.dart';
import 'package:learning_management/features/routine/domain/entities/class_routine_entities.dart';

sealed class RoutineRemoteDatasource{
  Future<Either<Failure,ClassRoutineEntity>> getClassRoutines({required String sectionId, required DateTime dateTime});
}

class RoutineRemoteDatasourceImpl implements RoutineRemoteDatasource{

  @override
  Future<Either<Failure, ClassRoutineEntity>> getClassRoutines({required String sectionId, required DateTime dateTime}) async {
    try{

      String daysOfWeek = DateTimeFormatters.formatDayOfWeek(dateTime: dateTime).toUpperCase();
      Response response = await sl<DioClient>().get("${ApiUrls.classRoutines}$sectionId/day/$daysOfWeek");

      ClassRoutineEntity todaysClassEntity = ClassRoutineModel.fromJson(response.data).toEntity();
      return Right(todaysClassEntity);

    }catch(error, stackTrace){
      log(
          "Routine Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

}