
import 'package:e_comm_app/main.dart';
import 'package:e_comm_app/screens/auth_ui/sign_in_screen.dart';
import 'package:e_comm_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.AppSecondaryColor,
          title: Text(
            "Sign Up",
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
              SizedBox(
                height: Get.height / 20,
              ),
              Text("Welcome to my app",
                style: TextStyle(
                  fontSize: 21,
                  color: AppConstant.AppSecondaryColor,
                  fontWeight: FontWeight.bold,
                ),),

              SizedBox(
                height: Get.height / 20,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.AppSecondaryColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.people),
                        prefixIconColor: Colors.grey,
                        contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.AppSecondaryColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIconColor: Colors.grey,
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.email),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.AppSecondaryColor,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Phone",
                        prefixIconColor: Colors.grey,
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.phone),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    cursorColor: AppConstant.AppSecondaryColor,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        hintText: "City",
                        prefixIconColor: Colors.grey,
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.location_city),
                        contentPadding: EdgeInsets.only(top: 2.0, left: 2.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    obscureText: true,
                    cursorColor: AppConstant.AppSecondaryColor,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.password),
                        prefixIconColor: Colors.grey,
                        suffixIcon: Icon(Icons.visibility_off),
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
                    onPressed: () {},
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: AppConstant.AppTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: Get.height / 20,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have an account? ",
                    style: TextStyle(
                      color: AppConstant.AppSecondaryColor,
                      fontSize: 17,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.offAll(() => SignInScreen()),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                        color: AppConstant.AppSecondaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
