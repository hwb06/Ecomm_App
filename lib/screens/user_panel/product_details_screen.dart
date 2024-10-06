import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/controllers/rating_controller.dart';
import 'package:e_comm_app/models/cart_model.dart';
import 'package:e_comm_app/models/review_model.dart';
import 'package:e_comm_app/screens/user_panel/single_category_products_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_card/image_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/category.dart';
import '../../models/product_model.dart';
import '../../utils/app_constant.dart';
import '../auth_ui/sign_in_screen.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;

  ProductDetailsScreen({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CalculateProductRatingController calculateProductRatingController = Get.put(
        CalculateProductRatingController(widget.productModel.productId));
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.AppSecondaryColor,
        title: Text(
          'Product Details',
          style: TextStyle(
              color: AppConstant.AppTextColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.shopping_cart,
                color: AppConstant.AppTextColor,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //product images
              SizedBox(
                height: Get.height / 60,
              ),
              CarouselSlider(
                items: widget.productModel.productImages
                    .map(
                      (imgUrls) => ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: imgUrls,
                      fit: BoxFit.cover,
                      width: Get.width - 10,
                      placeholder: (context, url) => ColoredBox(
                        color: Colors.white,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                )
                    .toList(),
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  autoPlay: true,
                  aspectRatio: 2.5,
                  viewportFraction: 1,
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.productModel.productName),
                              Icon(Icons.favorite_outline),
                            ],
                          ),
                        ),
                      ),

                      //Reviews Rating
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child:  RatingBar.builder(
                                initialRating: double.parse(calculateProductRatingController.averageRating.toString()),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 25,
                                itemPadding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (value) {
                                },
                              ),
                            ),
                            Text(calculateProductRatingController.averageRating.toString()),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Row(
                            children: [
                              widget.productModel.isSale == true &&
                                  widget.productModel.salePrice != ''
                                  ? Text(
                                "PKR: " + widget.productModel.salePrice,
                              )
                                  : Text(
                                "PKR: " + widget.productModel.fullPrice,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                              "Category: " + widget.productModel.categoryName),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Text("Description: " +
                              widget.productModel.productDescription),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Material(
                              child: Container(
                                width: Get.width / 3.0,
                                height: Get.height / 16,
                                decoration: BoxDecoration(
                                  color: AppConstant.AppSecondaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextButton(
                                  child: Text(
                                    "Whatsapp",
                                    style: TextStyle(
                                      color: AppConstant.AppTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    sendMessageOnWhatsApp(
                                      productModel: widget.productModel,
                                    );
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Material(
                              child: Container(
                                width: Get.width / 3.0,
                                height: Get.height / 16,
                                decoration: BoxDecoration(
                                  color: AppConstant.AppSecondaryColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: TextButton(
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(
                                      color: AppConstant.AppTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await checkProductExistence(uId: user!.uid);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              //Review and feedback Section
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Customer Reviews",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: AppConstant.AppSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('products')
                    .doc(widget.productModel.productId)
                    .collection('review')
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                      child: Text("No reviews found!"),
                    );
                  }

                  if (snapshot.data != null) {
                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
                        ReviewModel reviewModel = ReviewModel(
                          customerName: data['customerName'],
                          customerPhone: data['customerPhone'],
                          customerDeviceToken: data['customerDeviceToken'],
                          customerId: data['customerId'],
                          feedback: data['feedback'],
                          rating: data['rating'],
                          createdAt: data['createdAt'],
                        );
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(reviewModel.customerName[0]),
                            ),
                            title: Text(reviewModel.customerName),
                            subtitle: Text(reviewModel.feedback),
                            trailing: Text(reviewModel.rating),
                          ),
                        );
                      },
                    );
                  }

                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //send message on whatsapp
  static Future<void> sendMessageOnWhatsApp(
      {required ProductModel productModel}) async {
    final number = "+03376300120";
    final message =
        "Hello Hussnain \n I Want To Know About This Product \n ${productModel.productName} \n ${productModel.productId}";

    final url = 'https://wa.me/$number? text = ${Uri.encodeComponent(message)}';

    if (await canLaunchUrl(url as Uri)) {
      await launch(url);
    } else {
      throw 'Could Not Launch $url';
    }
  }

  //check product exist or not
  Future<void> checkProductExistence({
    required String uId,
    int quantityIncrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(widget.productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      double totalPrice = double.parse(widget.productModel.isSale
          ? widget.productModel.salePrice
          : widget.productModel.fullPrice) *
          updatedQuantity;

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice,
      });
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set({
        'uId': uId,
        'createdAt': DateTime.now(),
      });

      print("product exists");

      CartModel cartModel = CartModel(
        productId: widget.productModel.productId,
        categoryId: widget.productModel.categoryId,
        productName: widget.productModel.productName,
        categoryName: widget.productModel.categoryName,
        salePrice: widget.productModel.salePrice,
        fullPrice: widget.productModel.fullPrice,
        productImages: widget.productModel.productImages,
        deliveryTime: widget.productModel.deliveryTime,
        isSale: widget.productModel.isSale,
        productDescription: widget.productModel.productDescription,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        productQuantity: 1,
        productTotalPrice: double.parse(widget.productModel.isSale
            ? widget.productModel.salePrice
            : widget.productModel.fullPrice),
      );
      await documentReference.set(cartModel.toMap());

      print("product added");
    }
  }
}