import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/responsive.dart';
import 'product_card.dart';

/// Reusable grid of ProductCards whose column count adapts to the screen.
class ProductGrid extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product> onProductTap;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    // Breakpoints (MediaQuery): 2 / 3 / 4 columns for mobile / tablet / desktop.
    final columns = Responsive.gridColumns(Responsive.width(context));

    // LayoutBuilder: sizes each card from the width actually available to the
    // grid (the screen width minus the NavigationRail on larger screens).
    return LayoutBuilder(
      builder: (context, constraints) {
        const spacing = 12.0;
        final cardWidth =
            (constraints.maxWidth - spacing * (columns + 1)) / columns;
        // Fixed info area (~110 px) below a roughly square image area.
        final aspectRatio = cardWidth / (cardWidth * 0.8 + 110);

        return GridView.builder(
          padding: const EdgeInsets.all(spacing),
          itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            childAspectRatio: aspectRatio,
          ),
          itemBuilder: (context, index) => ProductCard(
            product: products[index],
            onTap: () => onProductTap(products[index]),
          ),
        );
      },
    );
  }
}
