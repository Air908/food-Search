import 'package:flutter/material.dart';
import 'package:food/screens/login_screen.dart';

void main() {
  runApp(FoodSearchApp());
}

class FoodSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
