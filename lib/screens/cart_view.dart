import 'package:flutter/material.dart';

import '../models/cart.dart';
import '../models/product.dart';
import '../widgets/empty_state.dart';

/// Cart tab: items with quantity controls, the total and a checkout button.
class CartView extends StatelessWidget {
  final ValueChanged<Product> onProductTap;

  const CartView({super.key, required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    // ListenableBuilder rebuilds this view whenever the cart changes.
    return ListenableBuilder(
      listenable: cart,
      builder: (context, _) {
        if (cart.items.isEmpty) {
          return const EmptyState(
            icon: Icons.shopping_cart_outlined,
            message: 'Your cart is empty',
          );
        }
        final entries = cart.items.entries.toList();

        // ConstrainedBox: limits the list width so it stays readable on desktop.
        return Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(12),
                    itemCount: entries.length,
                    separatorBuilder: (_, _) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final product = entries[index].key;
                      final qty = entries[index].value;
                      return ListTile(
                        onTap: () => onProductTap(product),
                        leading: CircleAvatar(child: Text(product.emoji)),
                        title: Text(product.name),
                        subtitle: Text(
                            'Rs. ${product.price.toStringAsFixed(0)} x $qty'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              tooltip: 'Decrease',
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () => cart.decrease(product),
                            ),
                            Text('$qty'),
                            IconButton(
                              tooltip: 'Increase',
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () => cart.add(product),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Total: Rs. ${cart.total.toStringAsFixed(0)}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      FilledButton.icon(
                        onPressed: () {
                          final count = cart.itemCount;
                          cart.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content:
                                    Text('Order placed for $count item(s)')),
                          );
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('Checkout'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
