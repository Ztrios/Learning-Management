import 'package:dartz/dartz.dart';
import 'package:learning_management/config/service_locator/service_locator.dart';
import 'package:learning_management/core/error/failure.dart';
import 'package:learning_management/core/usecase/usecase.dart';
import 'package:learning_management/features/home/domain/entities/announcements_entity.dart';
import 'package:learning_management/features/home/domain/repositories/home_repositories.dart';

class GetAnnouncementsUseCase extends UseCase<AnnouncementsEntity, dynamic>{
  @override
  Future<Either<Failure, AnnouncementsEntity>> call({params}) async =>
      await sl<HomeRepositories>().getAnnouncements();
}