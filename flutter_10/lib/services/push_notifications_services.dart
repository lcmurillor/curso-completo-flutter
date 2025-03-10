//81:13:4E:DF:94:63:83:87:01:90:37:BA:B0:37:01:7E:DC:40:D9:80

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static final StreamController<String> _messageStreamController =
      StreamController.broadcast();
  static Stream<String> get messageSreamController =>
      _messageStreamController.stream;

  static Future initializeApp() async {
    //push ntofications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    // print(token);
    //Handler
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    //local notifications
  }

  static Future _backgroundHandler(RemoteMessage message) async {
    // print(' on Background Handler ${message.messageId}');
    // _messageStreamController.add(message.notification?.title ?? 'No title');
    _messageStreamController.add(message.data['product'] ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    // print('on Message Handler ${message.messageId}');
    // print(message.data);
    // _messageStreamController.add(message.notification?.title ?? 'No title');
    _messageStreamController.add(message.data['product'] ?? 'No title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    // print('on Message Open App ${message.messageId}');
    _messageStreamController.add(message.data['product'] ?? 'No title');
  }

  static closeStreams() {
    _messageStreamController.close();
  }
}
