import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/controllers/banners_controller.dart';
import 'package:e_comm_app/models/order_model.dart';
import 'package:e_comm_app/screens/user_panel/main_screen.dart';
import 'package:e_comm_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'generate_order_id_service.dart';

void placeOrder(
    {required BuildContext context,
    required String customerName,
    required String customerPhone,
    required String customerAddress,
    required String customerDeviceToken}) async {

  final user = FirebaseAuth.instance.currentUser;
  EasyLoading.show(status: "Please wait..");

  if (user != null) {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .doc(user.uid)
          .collection('cartOrders')
          .get();

      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (var doc in documents) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;

        String orderId = generateOrderId();

        OrderModel cartModel = OrderModel(
          productId: data['productId'],
          categoryId: data['categoryId'],
          productName: data['productName'],
          categoryName: data['categoryName'],
          salePrice: data['salePrice'],
          fullPrice: data['fullPrice'],
          productImages: data['productImages'],
          deliveryTime: data['deliveryTime'],
          isSale: data['isSale'],
          productDescription: data['productDescription'],
          createdAt: DateTime.now(),
          updatedAt: data['updatedAt'],
          productQuantity: data['productQuantity'],
          productTotalPrice: double.parse(
            data['productTotalPrice'].toString(),
          ),
          customerId: user.uid,
          status: false,
          customerName: customerName,
          customerPhone: customerPhone,
          customerAddress: customerAddress,
          customerDeviceToken: customerDeviceToken,
        );

        for (var x = 0; x < documents.length; x++) {
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(user.uid)
              .set(
            {
              'uId': user.uid,
              'customerName': customerName,
              'customerPhone': customerPhone,
              'customerAddress': customerAddress,
              'customerDeviceToken': customerDeviceToken,
              'orderStatue': false,
              'createdAt': DateTime.now(),
            },
          );

          //upload orders
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(user.uid)
              .collection('confirmOrders')
              .doc(orderId)
              .set(cartModel.toMap());

          //delete cart products
          await FirebaseFirestore.instance
              .collection('cart')
              .doc(user.uid)
              .collection('cartOrders')
              .doc(cartModel.productId.toString())
              .delete()
              .then((value) {
            print("Delete Cart Products $cartModel.productId.toString() ");
          });
        }
      }
      print("Order Confirmed");
      Get.snackbar(
        "Order Confirmed",
        "Thank You For Your Order!",
        backgroundColor: AppConstant.AppSecondaryColor,
        colorText: Colors.white,
        duration: Duration(seconds: 5),
      );

      EasyLoading.dismiss();
      Get.offAll(() => MainScreen());

    } catch (e) {
      print("Error $e");
    }
  }
}
