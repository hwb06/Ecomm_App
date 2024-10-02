
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comm_app/models/user_model.dart';
import 'package:e_comm_app/screens/auth_ui/sign_in_screen.dart';
import 'package:e_comm_app/utils/app_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> ForgetPasswordMethod(
      String userEmail,
      ) async {
    try {
      EasyLoading.show(status: "Please Wait..");

      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        "Request Sent Successfully",
        "Password Reset Link Send To $userEmail",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.AppSecondaryColor,
        colorText: AppConstant.AppTextColor,
      );
      
      Get.offAll(() => SignInScreen());

      EasyLoading.dismiss();
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.AppSecondaryColor,
        colorText: AppConstant.AppTextColor,
      );
    }
  }
}
