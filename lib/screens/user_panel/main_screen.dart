import 'package:e_comm_app/controllers/google_signin_controller.dart';
import 'package:e_comm_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_comm_app/utils/app_constant.dart';
import 'package:e_comm_app/widgets/banner_widget.dart';
import 'package:e_comm_app/widgets/custom_drawer_widget.dart';
import 'package:e_comm_app/widgets/flash_sale_widget.dart';
import 'package:e_comm_app/widgets/heading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widgets/category_widget.dart';
import 'all_categories_screen.dart';

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
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          AppConstant.appMainName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: Get.height/90.0,
              ),
              //banners
              BannerWidget(),

              //heading
              HeadingWidget(
                headingTitle: "Categories",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllCategoriesScreen()),
                buttonText: "See More >",
              ),

              //Categories Section
              CategoryWidget(),
              //Heading 02
              HeadingWidget(
                headingTitle: "Flash Sales",
                headingSubTitle: "According to your budget",
                onTap: (){},
                buttonText: "See More >",
              ),

              FlashSaleWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
