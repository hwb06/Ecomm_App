import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_constant.dart';

class HeadingWidget extends StatelessWidget {

  final String headingTitle;
  final String headingSubTitle;
  final VoidCallback onTap;
  final String buttonText;

  HeadingWidget({
    super.key,
    required this.headingTitle,
    required this.headingSubTitle,
    required this.onTap,
    required this.buttonText,
});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingTitle,
                  style: TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                    fontSize: 16,
                  ),
                ),
                Text(
                  headingSubTitle,
                  style: TextStyle(fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 11.0
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: AppConstant.AppSecondaryColor,
                    width: 1.5,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(buttonText, style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: AppConstant.AppSecondaryColor,
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
