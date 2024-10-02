import 'package:e_comm_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/auth_ui/welcome_screen.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Hussnain Waheed", style: TextStyle(color: AppConstant.AppTextColor, fontWeight: FontWeight.bold, fontSize: 18),),
                subtitle: Text("Software Engineer", style: TextStyle(color: AppConstant.AppTextColor),),
                leading: CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.green,
                  child: Text("H", style: TextStyle(color: AppConstant.AppTextColor),),
                ),
              ),
            ),
            Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Home", style: TextStyle(color: AppConstant.AppTextColor, fontWeight: FontWeight.bold, fontSize: 17),),
                leading: Icon(Icons.home, color: AppConstant.AppTextColor, size: 25),
                trailing: Icon(Icons.arrow_forward, color: AppConstant.AppTextColor, size: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Products", style: TextStyle(color: AppConstant.AppTextColor, fontWeight: FontWeight.bold, fontSize: 17),),
                leading: Icon(Icons.production_quantity_limits, color: AppConstant.AppTextColor, size: 25),
                trailing: Icon(Icons.arrow_forward, color: AppConstant.AppTextColor, size: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Orders", style: TextStyle(color: AppConstant.AppTextColor, fontWeight: FontWeight.bold, fontSize: 17),),
                leading: Icon(Icons.shopping_bag, color: AppConstant.AppTextColor, size: 25),
                trailing: Icon(Icons.arrow_forward, color: AppConstant.AppTextColor,),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Contact", style: TextStyle(color: AppConstant.AppTextColor, fontWeight: FontWeight.bold, fontSize: 17),),
                leading: Icon(Icons.help, color: AppConstant.AppTextColor, size: 25),
                trailing: Icon(Icons.arrow_forward, color: AppConstant.AppTextColor, size: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                onTap: () async{
                  GoogleSignIn googleSigniIn = GoogleSignIn();
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  await _auth.signOut();
                  await googleSigniIn.signOut();
                  Get.offAll(() => WelcomeScreen());
                },
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Logout", style: TextStyle(color: AppConstant.AppTextColor, fontWeight: FontWeight.bold, fontSize: 17),),
                leading: Icon(Icons.logout, color: AppConstant.AppTextColor, size: 25),
                trailing: Icon(Icons.arrow_forward, color: AppConstant.AppTextColor, size: 25),
              ),
            ),
          ],
        ),
        backgroundColor: AppConstant.AppSecondaryColor,
      ),
    );
  }
}
