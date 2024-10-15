import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/add_review.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/widgets/review_widget.dart';
import 'package:laza_mashro3/widgets/reviews.dart';
import 'package:laza_mashro3/widgets/star_rating_widget.dart';
import 'package:provider/provider.dart';

import '../cubits/product_cuibt.dart';
import '../models/product.dart';
import '../theme_color/Colors.dart';
import 'add_review.dart';

class ReviewScreen extends StatelessWidget {
  final Product product;

  // final Reviews review;

  const ReviewScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    List<Reviews> review = product.reviews;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Reviews',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xFFF5F6FA),
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.arrow_back,
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddReview()));
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.mode_edit_outline_outlined,
                            color: Colors.white,
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

                // Expanded(
                //   child: Provider<ProductCubit>(create: (_) => ProductCubit(),
                //     builder: (context, child) {
                //       return BlocBuilder<ProductCubit, ProductState>(
                //
                //           builder: (context, state) {
                //             if (state is ProductLoading) {
                //               return const Center(
                //                 child: CircularProgressIndicator(
                //                   color: Color(0xFFE23E3E),
                //                 ),
                //               );
                //             } else if (state is ProductError) {
                //               return Center(
                //                 child: Text(state.message),
                //               );
                //             } else if (state is ProductLoaded) {
                //               return SizedBox(
                //                 width: double.infinity,
                //                 height: 600,
                //                 child: ListView.builder(
                //                   itemCount: product.reviews.length,
                //                   itemBuilder: (BuildContext context, int index) {
                //                     return ReviewWidget(
                //                       review: review[index],
                //                     );
                //                   },
                //                 ),
                //               );
                //             } else {
                //               return const Center(
                //                 child: Text('No Response'),
                //               );
                //             }
                //
                //           });
                //     },
                //   ),
                // ),

                Expanded(
                  child: Provider<AddReviewCubit>(
                      create: (_) => AddReviewCubit(),
                      builder: (context, child) {
                        return BlocBuilder<AddReviewCubit, List<Reviews>>(
                          builder: (context, review) {
                            return SizedBox(                          width: double.infinity,
                              height: 600,
                              child: ListView.builder(
                                itemCount: review.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ReviewWidget(
                                    review: review[index],
                                  );
                                },
                              ),
                            );
                          },
                        );
                      }),
                ),
              ],
            ),
            ),
        );
    }
}