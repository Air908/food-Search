import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../screens/food_detail_page.dart';

class FoodCard extends StatelessWidget {
  final FoodItem foodItem;
  final VoidCallback onTap;

  FoodCard({required this.foodItem, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailPage(foodItem: foodItem),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Image.asset(
                foodItem.image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      foodItem.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(foodItem.description, style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 5),
                    Text(
                      '${foodItem.calories} Calories',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    '\$${foodItem.price}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      foodItem.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: foodItem.isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      foodItem.isFavorite = !foodItem.isFavorite;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
