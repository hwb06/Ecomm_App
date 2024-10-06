import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CalculateProductRatingController extends GetxController {
  final String productId;
  RxDouble averageRating = 0.0.obs;

  CalculateProductRatingController(this.productId);

  @override
  void onInit() {
    super.onInit();
    calculateAverageRating();
  }

  void calculateAverageRating() {
    FirebaseFirestore.instance
        .collection('products')
        .doc(productId)
        .collection('review')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        double totalRating = 0;
        int numberOfReviews = 0;
        snapshot.docs.forEach((doc) {
          final ratingAsString = doc['rating'] as String;
          // Convert string rating to double
          final rating = double.tryParse(ratingAsString);
          if (rating != null) {
            totalRating += rating;
            numberOfReviews++;
          }
        });
        averageRating.value = numberOfReviews != 0 ? totalRating / numberOfReviews : 0.0;
      } else {
        averageRating.value = 0.0;
      }
    });
  }
}
