import 'package:flutter/material.dart';
import 'package:food/screens/login_screen.dart';

import '../models/food_item.dart';
import '../services/backend_service.dart';
import 'package:food/widgets/food_card.dart';
import 'package:food/screens/food_detail_page.dart';
import 'cart_screen.dart';


class FoodSearchPage extends StatefulWidget {
  @override
  _FoodSearchPageState createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  List<FoodItem> foodItems = BackendService.getFoodItems();
  String _selectedFilter = 'None';

  void _filterFoodItems(String filter) {
    setState(() {
      _selectedFilter = filter;
      if (filter == 'Calories') {
        foodItems.sort((a, b) => a.calories.compareTo(b.calories));
      } else if (filter == 'Price') {
        foodItems.sort((a, b) => a.price.compareTo(b.price));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Add your onPressed code here!
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
        ),
        title: Text(
          'Search Food',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Spice Food',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Found ${foodItems.length} results',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list, color: Colors.yellow),
                  onSelected: _filterFoodItems,
                  itemBuilder: (BuildContext context) {
                    return {'None', 'Calories', 'Price'}.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                )
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return FoodCard(
                    foodItem: foodItems[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodDetailPage(foodItem: foodItems[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
