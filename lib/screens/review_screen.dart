import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza_mashro3/cubits/product_cuibt.dart';
import 'package:laza_mashro3/cubits/product_state.dart';
import 'package:laza_mashro3/widgets/review_widget.dart';
import 'package:laza_mashro3/widgets/star_rating_widget.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
        child: SingleChildScrollView(
            child: Provider<ProductCubit>(
          create: (_) => ProductCubit(),
          builder: (context, child) {
            return BlocBuilder<ProductCubit, ProductState>(
                builder: (context, state) {
              if (state is ProductLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFE23E3E),
                  ),
                );
              } else if (state is ProductError) {
                return Center(
                  child: Text(state.message),
                );
              } else if (state is ProductLoaded) {
                return Column(
                  children: [
                    InfoReview(
                      product: state.products[1],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 400,
                      height: 800,
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return ReviewWidget();
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('No Response'),
                );
              }
            });
          },
        )),
      ),
    );
  }
}
