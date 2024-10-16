import 'package:flutter/material.dart';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/cart_model.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/models/product_model.dart';
import 'package:laza_mashro3/screens/cart_screen.dart';
import 'package:laza_mashro3/screens/category_items.dart';
import 'package:laza_mashro3/screens/review_screen.dart';
import 'package:laza_mashro3/widgets/single_review_widget.dart';

class ProductPage extends StatefulWidget {
  Product productModel;
  ProductPage(this.productModel);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _currentImageIndex = 0;

  void _changeImage(int index) {
    setState(() {
      _currentImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
              //   _changeImage(
              //       (_currentImageIndex - 1 + widget.productModel.images.length) %
              //           widget.productModel.images.length);
              //
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.card_travel),
              onPressed: () {
                //action add item
                cartProduct.add(CartModel(
                    id: widget.productModel.id,
                    title: widget.productModel.title,
                    images: widget.productModel.images,
                    price: widget.productModel.price));
                showSnackBar(context,
                    "The product has been successfully added to the cart.");
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.productModel.images[_currentImageIndex],
                height: 150,
              ),
            ),
            Row(
              children: [
                Text(
                  widget.productModel.title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text(
                      "Price",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      widget.productModel.price.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:
                    List.generate(widget.productModel.images.length, (index) {
                  return GestureDetector(
                    onTap: () => _changeImage(index),
                    child: Image.network(
                      widget.productModel.images[index],
                      height: 50,
                    ),
                  );
                }),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Description:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.productModel.description,
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Reviews",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ReviewScreen(
                        product: widget.productModel,
                      );
                    }));
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            SingleReviewWidget(
              reviewModel: widget.productModel.reviews[0],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, CartScreen.id);
                },
                child: Text('Add to Cart'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
