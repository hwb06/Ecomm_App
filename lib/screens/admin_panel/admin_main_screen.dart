
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_constant.dart';

class AdminMainScreen extends StatefulWidget{


  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.AppSecondaryColor,
        title: Text(
          "Admin Panel",
          style: TextStyle(
            color: AppConstant.AppTextColor,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}