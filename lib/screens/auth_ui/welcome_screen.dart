import 'package:e_comm_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google_signin_controller.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.AppSecondaryColor,
        title: Text(
          "Welcome to my app",
          style: TextStyle(
              color: AppConstant.AppTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 330,
            color: AppConstant.AppSecondaryColor,
            child: Center(
              child: Lottie.asset(
                'assets/images/ecom_buckett.json',
                // Replace with your shopping cart animation
                width: 220,
                height: 220,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            child: Text(
              'Happy Shopping',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 14,
              decoration: BoxDecoration(
                color: AppConstant.AppSecondaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(
                icon: Image.asset(
                  "assets/images/final-google-logo.png",
                  width: Get.width / 12,
                  height: Get.height / 12,
                ),
                onPressed: () {
                  _googleSignInController.signInWithGoogle();
                },
                label: Text(
                  "Sign in with google",
                  style: TextStyle(
                    color: AppConstant.AppTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 70,
          ),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 14,
              decoration: BoxDecoration(
                color: AppConstant.AppSecondaryColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: TextButton.icon(
                icon: Icon(
                  Icons.email,
                  color: AppConstant.AppTextColor,
                ),
                onPressed: () {},
                label: Text(
                  "Sign in with email",
                  style: TextStyle(
                    color: AppConstant.AppTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
