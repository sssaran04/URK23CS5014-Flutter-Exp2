import 'package:flutter/foundation.dart';

import 'product.dart';

/// Shared shopping state: cart items (with quantities) and the wishlist.
/// ChangeNotifier lets every screen rebuild when the cart changes.
class CartModel extends ChangeNotifier {
  final Map<Product, int> _items = {};
  final Set<Product> _wishlist = {};

  Map<Product, int> get items => Map.unmodifiable(_items);
  List<Product> get wishlist => _wishlist.toList();

  int get itemCount => _items.values.fold(0, (sum, qty) => sum + qty);

  double get total => _items.entries
      .fold(0, (sum, entry) => sum + entry.key.price * entry.value);

  int quantityOf(Product product) => _items[product] ?? 0;

  void add(Product product) {
    _items[product] = quantityOf(product) + 1;
    notifyListeners();
  }

  void decrease(Product product) {
    final qty = quantityOf(product);
    if (qty <= 1) {
      _items.remove(product);
    } else {
      _items[product] = qty - 1;
    }
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  bool isWishlisted(Product product) => _wishlist.contains(product);

  void toggleWishlist(Product product) {
    if (!_wishlist.remove(product)) _wishlist.add(product);
    notifyListeners();
  }
}

/// Single app-wide instance (no external state-management package needed).
final cart = CartModel();
