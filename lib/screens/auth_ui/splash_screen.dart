import 'dart:async';
import 'package:e_comm_app/controllers/get_user_data_controller.dart';
import 'package:e_comm_app/screens/admin_panel/admin_main_screen.dart';
import 'package:e_comm_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_comm_app/screens/user_panel/main_screen.dart';
import 'package:e_comm_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// Splash Screen class which shows an animation and navigates to the MainScreen after 3 seconds
class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

// State class for SplashScreen
class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    // Timer to automatically navigate to MainScreen after 3 seconds
    Timer(Duration(seconds: 4), () {
      loggedin(context);
    });
  }

  Future<void> loggedin(BuildContext context) async {
    if (user != null) {
      final GetUserDataController getUserDataController =
          Get.put(GetUserDataController());
      var userData = await getUserDataController.getUserData(user!.uid);

      if(userData[0]['isAdmin'] == true){
        Get.offAll(() => AdminMainScreen());
      } else{
        Get.offAll(() => MainScreen());
      }

      Get.to(() => WelcomeScreen());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set the background color to AppSecondaryColor
      backgroundColor: AppConstant.AppSecondaryColor,
      appBar: AppBar(
        backgroundColor: AppConstant.AppSecondaryColor,
        elevation: 0, // Remove shadow under the app bar
      ),
      body: Container(
        child: Column(
          children: [
            // Expanded widget to make the Lottie animation take up available space
            Expanded(
              child: Container(
                alignment: Alignment.center, // Center the animation
                width: Get.width, // Full screen width
                // Load and display the Lottie animation asset
                child: Lottie.asset("assets/images/splash_icon.json"),
              ),
            ),
            // Text widget at the bottom of the screen showing 'Powered by' message
            Container(
              margin: EdgeInsets.only(bottom: 30), // Add space below the text
              width: Get.width, // Full screen width
              alignment: Alignment.center, // Center the text
              child: Text(
                AppConstant.appPoweredBy, // Powered by text
                style: TextStyle(
                    fontSize: 18, // Set font size
                    color: AppConstant.AppTextColor, // Set text color
                    fontWeight: FontWeight.bold // Make the text bold
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
