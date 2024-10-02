import 'package:e_comm_app/controllers/signin_controller.dart';
import 'package:e_comm_app/main.dart';
import 'package:e_comm_app/screens/auth_ui/signup_screen.dart';
import 'package:e_comm_app/screens/user_panel/main_screen.dart';
import 'package:e_comm_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/forget_password_controller.dart';

class ForgetPasswordScreen extends StatefulWidget {
  @override
  State<ForgetPasswordScreen> createState() => ForgetPasswordScreenState();
}

class ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController = Get.put(
      ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppConstant.AppSecondaryColor,
          title: Text(
            "Forget Password",
            style: TextStyle(
              color: AppConstant.AppTextColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
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
              SizedBox(
                height: Get.height / 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userEmail,
                    cursorColor: AppConstant.AppSecondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email),
                        prefixIconColor: Colors.grey,
                        contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
              ),

              SizedBox(
                height: Get.height / 20,
              ),
              Material(
                child: Container(
                  width: Get.width / 2.2,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.AppSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      String email = userEmail.text.trim();

                      if (email.isEmpty) {
                        Get.snackbar("Error", "Please Enter All Details",
                          backgroundColor: Colors.red,
                          colorText: AppConstant.AppTextColor,);
                      } else{
                        String email = userEmail.text.trim();
                        forgetPasswordController.ForgetPasswordMethod(email);

                      }
                      Get.offAll(() => MainScreen());
                    },
                    child: Text(
                      "Forget",
                      style: TextStyle(
                        color: AppConstant.AppTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
