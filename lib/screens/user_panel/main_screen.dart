import 'package:e_comm_app/controllers/google_signin_controller.dart';
import 'package:e_comm_app/screens/auth_ui/welcome_screen.dart';
import 'package:e_comm_app/screens/user_panel/cart_screen.dart';
import 'package:e_comm_app/services/fcm_service.dart';
import 'package:e_comm_app/services/notification_service.dart';
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

import '../../widgets/all_product_widget.dart';
import '../../widgets/category_widget.dart';
import 'all_categories_screen.dart';
import 'all_flash_sale_products.dart';
import 'all_products_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    super.initState();
    notificationService.requestNotificationPermission();
    notificationService.getDeviceToken();
    FCMService.firebaseInit();
  }

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
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.shopping_cart),
            ),
          ),
        ],
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
                onTap: () => Get.to(() => AllFlashSaleProductScreen()),
                buttonText: "See More >",
              ),

              FlashSaleWidget(),

              HeadingWidget(
                headingTitle: "All Products",
                headingSubTitle: "According to your budget",
                onTap: () => Get.to(() => AllProductsScreen()),
                buttonText: "See More >",
              ),

              AllProductsWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
