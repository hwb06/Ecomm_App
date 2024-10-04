import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_constant.dart';

class CartScreen extends StatefulWidget {

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.AppSecondaryColor,
        title: Text(
          'Cart Screen',
          style: TextStyle(
              color: AppConstant.AppTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 20,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              color: AppConstant.AppTextColor,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppConstant.AppSecondaryColor,
                  child: Text("H"),
                ),
                title: Text("New Dress For Womens"),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("2200"),
                    SizedBox(width: Get.width/40.0,),
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: AppConstant.AppSecondaryColor,
                      child: Text("-"),
                    ),
                    SizedBox(width: Get.width/50.0,),
                    CircleAvatar(
                      radius: 18.0,
                      backgroundColor: AppConstant.AppSecondaryColor,
                      child: Text("+"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Total"),
            ),
            Text("PKR 12,00", style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: Container(
                  width: Get.width / 2.0,
                  height: Get.height / 18,
                  decoration: BoxDecoration(
                    color: AppConstant.AppSecondaryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: AppConstant.AppTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}