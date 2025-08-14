import 'package:learning_management/features/home/data/models/announcement_model.dart';

class AnnouncementsEntity{
  final int? statusCode;
  final String? message;
  final AnnouncementsData? announcementsData;

  AnnouncementsEntity({
    this.statusCode,
    this.message,
    this.announcementsData,
  });
}