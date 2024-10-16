import 'package:flutter/material.dart';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/helper/show_snack_bar.dart';
import 'package:laza_mashro3/models/cart_model.dart';
import 'package:laza_mashro3/models/product.dart';
import 'package:laza_mashro3/screens/cart_screen.dart';
import 'package:laza_mashro3/screens/category_items.dart';
import 'package:laza_mashro3/screens/review_screen.dart';
import 'package:laza_mashro3/theme_color/Colors.dart';
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
      backgroundColor:Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              icon: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20)),
                child: const Icon(Icons.shopping_bag_outlined),
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CartScreen()));
              },
            ),
          ),
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Icon(
                Icons.arrow_back_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            )),
      ),
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

          ],
        ),
      ),
    bottomNavigationBar: Container(
    width: double.infinity,
    height: 75,
    padding: const EdgeInsets.only(top: 10),
    color: mainColor,
    child: GestureDetector(
    onTap: () {
          cartProduct.add(CartModel(
              id: widget.productModel.id,
              title: widget.productModel.title,
              images: widget.productModel.images,
              price: widget.productModel.price));
          showSnackBar(context,
            "The product has been successfully added to the cart.",);

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartScreen();
          }));
        },
        child: Text('Add to Cart',textAlign: TextAlign.center,),

      ),
    ) );
  }
}
