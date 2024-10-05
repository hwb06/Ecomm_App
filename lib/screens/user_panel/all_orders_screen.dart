import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/controllers/cart_price_controller.dart';
import 'package:e_comm_app/models/cart_model.dart';
import 'package:e_comm_app/models/order_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_card/image_card.dart';

import '../../utils/app_constant.dart';
import 'checkout_screen.dart';

class AllOrdersScreen extends StatefulWidget {
  @override
  State<AllOrdersScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<AllOrdersScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  final ProductPriceController productPriceController =
      Get.put(ProductPriceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.AppSecondaryColor,
        title: Text(
          'All Orders',
          style: TextStyle(
              color: AppConstant.AppTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("orders")
            .doc(user!.uid)
            .collection('confirmOrders')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 4.5,
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text("No Products Found!"),
            );
          }
          if (snapshot.data != null) {
            return Container(
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final productData = snapshot.data!.docs[index];
                    OrderModel orderModel = OrderModel(
                      productId: productData['productId'],
                      categoryId: productData['categoryId'],
                      productName: productData['productName'],
                      categoryName: productData['categoryName'],
                      salePrice: productData['salePrice'],
                      fullPrice: productData['fullPrice'],
                      productImages: productData['productImages'],
                      deliveryTime: productData['deliveryTime'],
                      isSale: productData['isSale'],
                      productDescription: productData['productDescription'],
                      createdAt: productData['createdAt'],
                      updatedAt: productData['updatedAt'],
                      productQuantity: productData['productQuantity'],
                      productTotalPrice: double.parse(
                          productData['productTotalPrice'].toString()),
                      customerId: productData['customerId'],
                      status: productData['status'],
                      customerName: productData['customerName'],
                      customerPhone: productData['customerPhone'],
                      customerAddress: productData['customerAddress'],
                      customerDeviceToken: productData['customerDeviceToken'],
                    );

                    //calculate price
                    productPriceController.fetchProductPrice();

                    return Card(
                      elevation: 5,
                      color: AppConstant.AppTextColor,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppConstant.AppSecondaryColor,
                          backgroundImage:
                              NetworkImage(orderModel.productImages[0]),
                        ),
                        title: Text(orderModel.productName),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(orderModel.productTotalPrice.toString()),
                            SizedBox(
                              width: 10.0,
                            ),
                            orderModel.status != true
                                ? Text(
                                    "Pending..",
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Text(
                                    "Completed!",
                                    style: TextStyle(color: Colors.green),
                                  ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          }

          return Container();
        },
      ),
    );
  }
}
