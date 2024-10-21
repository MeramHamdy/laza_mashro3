import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/models/reviews.dart';

class AddReviewCubit extends Cubit<List<Reviews>> {
  AddReviewCubit() : super([]);

  void addReview(Reviews review) {
    final updatedReviews = List<Reviews>.from(state);
    updatedReviews.add(review);
    emit(updatedReviews);
  }
}

