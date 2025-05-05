import 'package:module_11_12/models/category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  Map<String, dynamic> toJson() {
    return {'name': name, 'quantity': quantity, 'category': category.title};
  }

  factory GroceryItem.fromJson(
    Map<String, dynamic> json,
    String id,
    List<Category> availableCategories,
  ) {
    final categoryTitle = json['category'] as String;
    return GroceryItem(
      id: id,
      name: json['name'] as String,
      quantity: json['quantity'] as int,
      category: availableCategories.firstWhere(
        (cat) => cat.title == categoryTitle,
      ),
    );
  }
}
