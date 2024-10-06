import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  // For Notification Setting
  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User Granted Permission");
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("User Provisional Granted Permission");
    } else {
      Get.snackbar(
        'Notification Permission Denied',
        "Please Allow Notification To Receive Updates.",
        snackPosition: SnackPosition.BOTTOM,
      );
      Future.delayed(Duration(seconds: 2), () {
        AppSettings.openAppSettings(type: AppSettingsType.notification);
      });
    }
  }

  // Get Token method moved outside
  Future<String?> getDeviceToken() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    String? token = await messaging.getToken();
    print("token => $token");
    return token; // Change this to return String? instead of String
  }
}
