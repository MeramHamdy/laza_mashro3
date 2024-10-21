import 'package:flutter/material.dart';
import 'package:laza_mashro3/models/reviews.dart';
import 'package:laza_mashro3/widgets/star_rating_widget.dart';

import '../theme_color/Colors.dart';

class ReviewWidget extends StatelessWidget {

  final Reviews review;

  const ReviewWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(

        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${review.reviewerName}',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                        Row(
                          children: [
                            const Icon(Icons.access_time_outlined,size: 12,color: greyDark,),
                            Text(review.date.toString(),style: const TextStyle(fontSize: 10,color: greyDark),),
            
                          ],
                        ),
            
            
                      ],
            
                    ),
                    const SizedBox(width: 95,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(review.rating.toString(),style: const TextStyle(fontWeight: FontWeight.bold),),
                            const SizedBox(width: 2,),
                            Text('rating',style: TextStyle(color: Colors.grey.shade600),)
                          ],
                        ),
                        StarRatingWidget(num: review.rating!.toInt(),),
                      ],
                    ),
                  ],
                ),
                Text(review.comment.toString(),style: const TextStyle(fontWeight: FontWeight.w400),),
                const SizedBox(height: 5,),
                const Divider(color: greyDark,height: 4,)
            
              ],
            
            ),
          ),


        ],
      ),
    );
  }
}
