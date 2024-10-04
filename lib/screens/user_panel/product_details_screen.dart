import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../models/product_model.dart';
import '../../utils/app_constant.dart';
import '../auth_ui/sign_in_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;

  ProductDetailsScreen({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppConstant.AppSecondaryColor,
        title: Text(
          'Product Details',
          style: TextStyle(
              color: AppConstant.AppTextColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: Text("PKR: " + widget.productModel.fullPrice),
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
                                onPressed: () {},
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
                                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
