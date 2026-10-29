import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/product.dart';
import '../widgets/empty_state.dart';
import '../widgets/product_grid.dart';

/// Wishlist tab: reuses the responsive ProductGrid for saved products.
class WishlistView extends StatelessWidget {
  final ValueChanged<Product> onProductTap;

  const WishlistView({super.key, required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cart,
      builder: (context, _) {
        if (cart.wishlist.isEmpty) {
          return const EmptyState(
            icon: Icons.favorite_border,
            message: 'Your wishlist is empty',
          );
        }
        return ProductGrid(
          products: cart.wishlist,
          onProductTap: onProductTap,
        );
      },
    );
  }
}
