import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../services/backend_service.dart';

class FoodDetailPage extends StatelessWidget {
  final FoodItem foodItem;

  FoodDetailPage({required this.foodItem});

  @override
  Widget build(BuildContext context) {
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
          foodItem.name,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              foodItem.image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              foodItem.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              foodItem.description,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Text(
              '${foodItem.calories} Calories',
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
            SizedBox(height: 20),
            Text(
              '\$${foodItem.price}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                BackendService.addToCart(foodItem);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('${foodItem.name} added to cart'),
                ));
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
