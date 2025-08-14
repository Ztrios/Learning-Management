import 'package:learning_management/core/utils/enums/enums.dart';

extension InternetConnectionX on InternetConnection{
  bool get isConnected => this == InternetConnection.connected;
  bool get isDisconnected => this == InternetConnection.disconnected;
}