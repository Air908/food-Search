import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../services/backend_service.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<FoodItem> cartItems = BackendService.getCartItems();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Shopping Cart',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      cartItems[index].image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(cartItems[index].name),
                    subtitle: Text('\$${cartItems[index].price}'),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        BackendService.removeFromCart(cartItems[index]);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('${cartItems[index].name} removed from cart'),
                        ));
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Add action to proceed with the purchase
              },
              child: Text('Proceed to Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
