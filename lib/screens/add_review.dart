import 'package:flutter/material.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';

class AddReview extends StatefulWidget {
  const AddReview({super.key});

  @override
  State<AddReview> createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {

   double currentSliderValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Reviews',
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
          onPressed: () {Navigator.pop(context);},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Name',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF5F6FA),
                  hintText: 'Type your name',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none)),
            ),
            const SizedBox(height: 7,),
            const Text('How was your experience ?',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(height: 7,),
            TextField(
              decoration: InputDecoration(

                  filled: true,
                  fillColor: const Color(0xFFF5F6FA),
                  hintText: 'Describe your experience?',
                  hintStyle: const TextStyle(color: Colors.grey,
                  height: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none)),
            ),
            const SizedBox(height: 7,),
            const Text('Star',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(height: 7,),
            Slider(value: currentSliderValue, onChanged: (double value){
              setState(() {
                currentSliderValue= value;
              });
            },
            max: 5,
              divisions: 5,
              label: currentSliderValue.round().toString(),
              activeColor: mainColor,
              inactiveColor: greyLight,
            ),
            Spacer(),
            
            ElevatedButton(onPressed: (){},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 111,vertical: 20),
                child: Text('Submit Review',style: TextStyle(color: white),),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: mainColor,shape: RoundedRectangleBorder()
              )),




          ],
        ),
      ),


    );
  }
}
