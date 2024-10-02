import 'package:e_comm_app/controllers/google_signin_controller.dart';
import 'package:e_comm_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_comm_app/utils/app_constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: AppConstant.AppMainColor,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async{
              GoogleSignIn googleSigniIn = GoogleSignIn();
              await googleSigniIn.signOut();
              Get.offAll(() => WelcomeScreen());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.logout, color: Colors.white, size: 25),
            ),
          )
        ],
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
