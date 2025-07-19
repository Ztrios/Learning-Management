import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:learning_management/core/utils/enums/enums.dart';

part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsBloc,NotificationState>{
  NotificationsBloc():super(NotificationState.initial());
}