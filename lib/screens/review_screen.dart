import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/add_review.dart';
import 'package:laza_mashro3/widgets/review_widget.dart';
import 'package:laza_mashro3/widgets/reviews.dart';
import 'package:laza_mashro3/widgets/star_rating_widget.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../theme_color/Colors.dart';
import 'add_review.dart';

class ReviewScreen extends StatelessWidget {
  final Product product;

  const ReviewScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    List<Reviews> review = product.reviews;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: transparent,
        title: Text(
          'Reviews',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20)),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    '${review.length} Reviews',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(product.rating.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      StarRatingWidget(
                        num: product.rating.toInt(),
                      )
                    ],
                  ),
                ]),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: addreview,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () async {
                    final newReview = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddReview()));
                    // If a review is returned, add it to the list
                    if (newReview != null && newReview is Reviews) {
                      product.reviews.add(newReview);
                      (context as Element).markNeedsBuild();
                    }
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.mode_edit_outline_outlined,
                        color: white,
                      ),
                      Text(
                        'Add Review',
                        style: TextStyle(color: white),
                      )
                    ],
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: product.reviews.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReviewWidget(
                    review: review[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
