/// Data model for a single product in the catalog.
class Product {
  final int id;
  final String name;
  final String category;
  final double price;
  final double rating;
  final String emoji;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.emoji,
    required this.description,
  });
}
