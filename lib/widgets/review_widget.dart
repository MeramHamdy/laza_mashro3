import 'package:flutter/material.dart';
import 'package:laza_mashro3/widgets/star_rating_widget.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(

      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('name reviewer'),
                    Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        Text('Date')
                      ],
                    ),


                  ],

                ),
                SizedBox(width: 150,),
                Column(
                  children: [
                    Text('rating'),
                    StarRatingWidget(num: 2,),
                  ],
                ),
              ],
            ),
            Text('comment')
          ],
        )
      ],
    );
  }
}
