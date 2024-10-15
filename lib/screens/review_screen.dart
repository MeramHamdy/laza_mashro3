import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/add_review.dart';
import 'package:laza_mashro3/widgets/review_widget.dart';
import 'package:laza_mashro3/widgets/reviews.dart';
import 'package:laza_mashro3/widgets/star_rating_widget.dart';
import 'package:provider/provider.dart';

import '../theme_color/Colors.dart';
import 'add_review.dart';

class ReviewScreen extends StatelessWidget {
  // final Product product;
  final Reviews review;

  ReviewScreen({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        'Reviews',
        style: TextStyle(fontWeight: FontWeight.bold)
    ,
    )
    ,
    centerTitle
    :
    true
    ,
    leading
    :
    IconButton
    (
    icon
    :
    Container
    (
    width
    :
    45
    ,
    height
    :
    45
    ,
    decoration
    :
    BoxDecoration
    (
    color
    :
    const
    Color
    (
    0xFFF5F6FA
    )
    ,
    borderRadius
    :
    BorderRadius
    .
    circular
    (
    20
    )
    )
    ,
    child
    :
    const
    Icon
    (
    Icons
    .
    arrow_back
    ,
    )
    ,
    )
    ,
    onPressed
    :
    (
    ) {
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
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

    Text('3 Reviews', style: TextStyle(
    fontWeight: FontWeight.bold, fontSize: 16),),
    Row(
    children: [
    Text(review.rating.toString(),
    style: TextStyle(fontWeight: FontWeight.bold)),
    StarRatingWidget(
    num:
    review.rating!.toInt(),
    )
    ],
    ),
    ]),
    const Spacer(),
    ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: addreview,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5))),
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=> AddReview()));

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
    Provider<AddReviewCubit>(
    create: (_) => AddReviewCubit(),
    builder: (context, child) {
    return BlocBuilder<AddReviewCubit, List<Reviews>>(
    builder: (context,review){
    return SizedBox(
      width: double.infinity,
      height: 600,
      child: ListView.builder(
        itemCount: review.length,
      itemBuilder: (BuildContext context, int index) {
      return ReviewWidget(
      review: review[index], );
      },
      ),
    );
    },


    );})


  ,

  ],
  ),
  ),
  );
}}
