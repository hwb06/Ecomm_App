

import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService{
  static void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message){
      print(message.notification!.title);
      print(message.notification!.body);
    });
  }
}