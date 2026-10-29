import 'package:flutter/material.dart';

import '../models/product.dart';
import 'price_tag.dart';
import 'rating_stars.dart';

/// Reusable card that shows one product: emoji image, name, rating and price.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({super.key, required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Expanded: the image area takes the remaining height of the cell.
            Expanded(
              child: Container(
                color: scheme.surfaceContainerHighest,
                alignment: Alignment.center,
                // FittedBox scales the emoji down to fit small cards.
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(product.emoji,
                        style: const TextStyle(fontSize: 56)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: RatingStars(rating: product.rating, size: 14),
                  ),
                  const SizedBox(height: 6),
                  PriceTag(price: product.price, fontSize: 13),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
