import 'package:flutter/material.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/screens/add_review.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class StarRatingWidget extends StatelessWidget {
  final int num;

  const StarRatingWidget({super.key, required this.num});

  @override
  Widget build(BuildContext context) {
    switch (num) {
      case (0):
        return const Row(
          children: [
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
          ],
        );

      case (1):
        return const Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
          ],
        );

      case (2):
        return const Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
          ],
        );
        break;
      case (3):
        return const Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(Icons.star_border_rounded),
            Icon(Icons.star_border_rounded),
          ],
        );

      case (4):
        return const Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(Icons.star_border_rounded),
          ],
        );

      case (5):
        return const Row(
          children: [
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
            Icon(
              Icons.star_rate_rounded,
              color: star,
            ),
          ],
        );
      default:
        return Container(
          child: const Center(
            child: Text("No ratinng"),
          ),
        );
    }
  }
}

class InfoReview extends StatelessWidget {
  final Product product;
  const InfoReview({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Column(children: [
          Text('${product.rating} Reviews'),
          Row(
            children: [
              Text(product.rating.toString()),
              StarRatingWidget(
                num:
                 product.rating.toInt(),
              )
            ],
          ),
        ]),
        const Spacer(),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: addReview,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => const AddReview()));
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
    );

  }
}


