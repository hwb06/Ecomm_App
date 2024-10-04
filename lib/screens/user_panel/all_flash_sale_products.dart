import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/models/product_model.dart';
import 'package:e_comm_app/screens/user_panel/single_category_products_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_card/image_card.dart';

import '../../models/category.dart';
import '../../utils/app_constant.dart';

class AllFlashSaleProductScreen extends StatefulWidget {
  @override
  State<AllFlashSaleProductScreen> createState() =>
      _AllFlashSaleProductScreenState();
}

class _AllFlashSaleProductScreenState extends State<AllFlashSaleProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.AppSecondaryColor,
        title: Text(
          "All Flash Sale Product",
          style: TextStyle(
              color: AppConstant.AppTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection("products").where('isSale',
        isEqualTo: true).get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
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
            return GridView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    childAspectRatio: 1.19),
                itemBuilder: (context, index) {
                  final productData  = snapshot.data!.docs[index];
                  ProductModel productModel = ProductModel(
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
                      updatedAt: productData['updatedAt']);

                  // CategoriesModel categoriesModel = CategoriesModel(
                  //   categoryId: snapshot.data!.docs[index]['categoryId'],
                  //   categoryImg: snapshot.data!.docs[index]['categoryImg'],
                  //   categoryName: snapshot.data!.docs[index]['categoryName'],
                  //   createdAt: snapshot.data!.docs[index]['createdAt'],
                  //   updatedAt: snapshot.data!.docs[index]['updatedAt'],
                  // );
                  return Row(
                    children: [
                      GestureDetector(
                        // onTap: () => Get.to(
                        //   () => AllSingleCategoryProductScreen(
                        //     categoryId: categoriesModel.categoryId,
                        //   ),
                        // ),
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: FillImageCard(
                              borderRadius: 20.0,
                              width: Get.width / 2.3,
                              heightImage: Get.height / 10,
                              imageProvider: CachedNetworkImageProvider(
                                productModel.productImages[0],
                              ),
                              title: Center(
                                child: Text(
                                  productModel.productName,
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              footer: Center(
                                  child: Text(
                                'Latest',
                                style: TextStyle(fontSize: 12),
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                });

            //   Container(
            //   height: Get.height / 5,
            //   child: ListView.builder(
            //       itemCount: snapshot.data!.docs.length,
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //
            // );
          }
          return Container();
        },
      ),
    );
  }
}