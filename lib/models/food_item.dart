class FoodItem {
  final String name;
  final String description;
  final int calories;
  final double price;
  final String image;
  bool isFavorite;

  FoodItem({
    required this.name,
    required this.description,
    required this.calories,
    required this.price,
    required this.image,
    this.isFavorite = false,
  });

  // Convert a FoodItem into a Map.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'calories': calories,
      'price': price,
      'image': image,
      'isFavorite': isFavorite,
    };
  }

  // Convert a Map into a FoodItem.
  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      name: map['name'],
      description: map['description'],
      calories: map['calories'],
      price: map['price'],
      image: map['image'],
      isFavorite: map['isFavorite'] ?? false,
    );
  }
}
