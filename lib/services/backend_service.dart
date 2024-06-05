
import '../models/food_item.dart';

class BackendService {
  static List<FoodItem> _foodItems = [
    FoodItem(
      name: 'Oni Sandwich',
      description: 'Spicy chicken sandwich',
      calories: 69,
      price: 6.72,
      image: 'assets/oni_sandwich.png',
    ),
    FoodItem(
      name: 'Dan Noodles',
      description: 'Spicy fruit mixed',
      calories: 120,
      price: 8.86,
      image: 'assets/dan_noodles.png',
    ),
    FoodItem(
      name: 'Chicken Dimsum',
      description: 'Spicy chicken dimsum',
      calories: 65,
      price: 6.99,
      image: 'assets/chicken_dimsum.png',
    ),
    FoodItem(
      name: 'Egg Pasta',
      description: 'Spicy chicken pasta',
      calories: 78,
      price: 9.80,
      image: 'assets/egg_pasta.png',
    ),
  ];

  static List<FoodItem> _cartItems = [];

  static List<FoodItem> getFoodItems() {
    return List<FoodItem>.from(_foodItems);
  }

  static void addToCart(FoodItem item) {
    _cartItems.add(item);
  }

  static void removeFromCart(FoodItem item) {
    _cartItems.remove(item);
  }

  static List<FoodItem> getCartItems() {
    return List<FoodItem>.from(_cartItems);
  }
}
