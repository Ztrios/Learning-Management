import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationHandlersService {
  final RemoteMessage message;
  const NotificationHandlersService(this.message);

  void notificationRedirection(){
    final screen = message.data["page"];
    switch(screen){
      case "home":
        //navigatorKey.currentState?.pushNamed(BottomNavigationPage.name);
    }
  }
}