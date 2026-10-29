import 'package:flutter/material.dart';

/// Reusable widget that shows a price in rupees inside a rounded tag.
class PriceTag extends StatelessWidget {
  final double price;
  final double fontSize;

  const PriceTag({super.key, required this.price, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: scheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Rs. ${price.toStringAsFixed(0)}',
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: scheme.onPrimaryContainer,
        ),
      ),
    );
  }
}
