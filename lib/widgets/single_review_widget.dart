import 'package:flutter/material.dart';
import 'package:laza_mashro3/widgets/reviews.dart';

class SingleReviewWidget extends StatelessWidget {
  Reviews reviewModel;

  SingleReviewWidget({required this.reviewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.person, color: Colors.grey),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reviewModel.reviewerName!,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text(
                        reviewModel.rating.toString(),
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      SizedBox(width: 8),
                      Text(reviewModel.date!,
                          style: TextStyle(fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Text(
          reviewModel.comment!,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
