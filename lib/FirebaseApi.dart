import 'package:firebase_messaging/firebase_messaging.dart';

class firebaseApi
{

  final _FirebaseMessage = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await _FirebaseMessage.requestPermission();
    final _fcmtoken = await _FirebaseMessage.getToken();
    print("FCM TOKEN : $_fcmtoken");
    initPushNotifications();
  }
  void handledMessage(RemoteMessage? message)
  {
    if(message == null) return;
    print('Firebase Message:$message');
  }
  // function to initialize background settings
  Future initPushNotifications() async {
     FirebaseMessaging.instance.getInitialMessage().then(handledMessage);
     FirebaseMessaging.onMessageOpenedApp.listen (handledMessage);
  }
}