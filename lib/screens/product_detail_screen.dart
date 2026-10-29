import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/product.dart';
import '../utils/responsive.dart';
import '../widgets/price_tag.dart';
import '../widgets/rating_stars.dart';

/// Product detail page: Column on mobile, Row on tablet/desktop.
/// Popping with the value 2 tells the catalog to open the Cart tab.
class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  void _addToCart(BuildContext context) {
    cart.add(product);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('${product.name} added to cart'),
          action: SnackBarAction(
            label: 'View cart',
            onPressed: () => Navigator.pop(context, 2),
          ),
        ),
      );
  }

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

    // Breakpoints: padding grows with the screen size.
    final padding =
        Responsive.value<double>(context, mobile: 16, tablet: 24, desktop: 40);

    // ListenableBuilder rebuilds the page when the cart or wishlist changes.
    return ListenableBuilder(
      listenable: cart,
      builder: (context, _) {
        final inWishlist = cart.isWishlisted(product);
        final inCart = cart.quantityOf(product);

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
            Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: () => _addToCart(context),
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Add to Cart'),
                ),
                if (inCart > 0) Text('In cart: $inCart'),
              ],
            ),
          ],
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(product.name),
            actions: [
              IconButton(
                tooltip: inWishlist ? 'Remove from wishlist' : 'Add to wishlist',
                icon: Icon(inWishlist ? Icons.favorite : Icons.favorite_border,
                    color: inWishlist ? Colors.red : null),
                onPressed: () => cart.toggleWishlist(product),
              ),
              IconButton(
                tooltip: 'Open cart',
                icon: Badge(
                  isLabelVisible: cart.itemCount > 0,
                  label: Text('${cart.itemCount}'),
                  child: const Icon(Icons.shopping_cart_outlined),
                ),
                onPressed: () => Navigator.pop(context, 2),
              ),
            ],
          ),
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
      },
    );
  }
}
