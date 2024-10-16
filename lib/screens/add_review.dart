import 'package:flutter/material.dart';
import 'package:laza_mashro3/cubits/add_review.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
import 'package:provider/provider.dart';
import '../widgets/reviews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerComment = TextEditingController();
  VoidCallback submit = () {};
  double currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        backgroundColor: transparent,
        title: Text(
          'Add Reviews',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextField(
                controller: controllerName,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    hintText: 'Type your name',
                    hintStyle: const TextStyle(color: greyDark),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'How was your experience ?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 7,
              ),
              TextField(
                controller: controllerComment,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    hintText: 'Describe your experience?',
                    hintStyle: const TextStyle(color: greyDark, height: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none)),
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Star',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(
                height: 7,
              ),
              Slider(
                value: currentSliderValue,
                onChanged: (double value) {
                  setState(() {
                    currentSliderValue = value;
                  });
                },
                max: 5,
                divisions: 5,
                label: currentSliderValue.round().toString(),
                activeColor: mainColor,
                inactiveColor: greyLight,
              ),
              Provider<AddReviewCubit>(
                create: (_) => AddReviewCubit(),
                builder: (context, child) {
                  return BlocBuilder<AddReviewCubit, List<Reviews>>(
                      builder: (context, review) {
                    return ElevatedButton(
                        onPressed: () {
                          final newReview = Reviews(
                            reviewerName: controllerName.text,
                            comment: controllerComment.text,
                            rating: currentSliderValue.toInt(),
                            date: DateTime.now().toString(),
                          );

                          // Pass the new review back to the previous screen
                          Navigator.pop(context, newReview);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            shape: const RoundedRectangleBorder()),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 111, vertical: 20),
                          child: Text(
                            'Submit Review',
                            style: TextStyle(color: white),
                          ),
                        ));
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
