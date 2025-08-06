import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/network/dio_client.dart';
import 'package:learning_management/features/payments/data/models/invoice_model.dart';
import 'package:learning_management/features/payments/domain/entities/invoice_entity.dart';

sealed class PaymentsRemoteDatasource {
  Future<Either<Failure,InvoiceEntity>> getInvoice({required String studentId});
}

class PaymentsRemoteDatasourceImpl implements PaymentsRemoteDatasource{

  @override
  Future<Either<Failure, InvoiceEntity>> getInvoice({required String studentId}) async {
    try{

      Response response = await sl<DioClient>().get(ApiUrls.invoice + studentId);
      InvoiceEntity invoiceEntity = InvoiceModel.fromJson(response.data).toEntity();
      return Right(invoiceEntity);

    }catch(error, stackTrace){
      log(
          "Payment Remote DataSource: ",
          error: error,
          stackTrace: stackTrace
      );
      return Left(UnknownFailure(error.toString()));
    }
  }

}