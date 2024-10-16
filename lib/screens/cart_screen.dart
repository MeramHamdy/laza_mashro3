import 'package:flutter/material.dart';
import 'package:laza_mashro3/constatnt.dart';
import 'package:laza_mashro3/screens/address_screen.dart';
import 'package:laza_mashro3/widgets/cart_item.dart';
import 'package:laza_mashro3/widgets/order_info.dart';

class CartScreen extends StatefulWidget {
  static String id = 'CartScreenId';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0;
  double cost = 10;
  double shippingCost = 10;

  @override
  Widget build(BuildContext context) {
    // Reset totalPrice to 0 before calculating
    totalPrice = 0;
    shippingCost = 0;
    for (var product in cartProduct) {
      totalPrice += (product.price + cost);
      shippingCost += cost;
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cart',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Expanded(
                child: ListView.builder(
                  itemCount: cartProduct.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        // Use the CartItem widget to display product details
                        Expanded(
                          child: CartItem(
                            imageUrl: cartProduct[index].images[0],
                            productName: cartProduct[index].title,
                            price: r'$ ' + cartProduct[index].price.toString(),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                          ),
                          onPressed: () {
                            setState(() {
                              // Remove the product from the cart
                              cartProduct.removeAt(index);
                            });
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            Divider(),
            Spacer(),
            Text(
              "Order Info",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrderInfoRow(
                    label: 'Shipping cost',
                    value: r'$ ' + shippingCost.toString(),
                  ),
                  OrderInfoRow(
                    label: 'Total',
                    value: r'$ ' + totalPrice.toString(),
                    isBold: true,
                  ),
                ],
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddressScreen();
                }));
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
