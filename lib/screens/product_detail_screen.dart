import 'package:flutter/material.dart';

import '../models/product.dart';
import '../utils/responsive.dart';
import '../widgets/price_tag.dart';
import '../widgets/rating_stars.dart';

/// Product detail page: Column on mobile, Row on tablet/desktop.
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // AspectRatio keeps the image area square at any screen size.
    final image = AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: scheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(product.emoji, style: const TextStyle(fontSize: 120)),
          ),
        ),
      ),
    );

    final info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Chip(label: Text(product.category)),
        const SizedBox(height: 8),
        Text(product.name, style: textTheme.headlineSmall),
        const SizedBox(height: 8),
        RatingStars(rating: product.rating, size: 20),
        const SizedBox(height: 12),
        PriceTag(price: product.price, fontSize: 20),
        const SizedBox(height: 16),
        Text(product.description, style: textTheme.bodyLarge),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${product.name} added to cart')),
          ),
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text('Add to Cart'),
        ),
      ],
    );

    // Breakpoints: padding grows with the screen size.
    final padding =
        Responsive.value<double>(context, mobile: 16, tablet: 24, desktop: 40);

    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Responsive.isMobile(context)
            // Mobile: image above the details (Column).
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [image, const SizedBox(height: 16), info],
              )
            // Tablet/desktop: image beside the details (Row + Flexible/Expanded).
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(flex: 2, child: image),
                  SizedBox(width: padding),
                  Expanded(flex: 3, child: info),
                ],
              ),
      ),
    );
  }
}
