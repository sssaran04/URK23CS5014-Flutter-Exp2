import 'package:flutter/material.dart';

/// Reusable widget that draws a 5-star rating (full, half and empty stars).
class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final bool showValue;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 16,
    this.showValue = true,
  });

  @override
  Widget build(BuildContext context) {
    final stars = List<Widget>.generate(5, (i) {
      final IconData icon;
      if (rating >= i + 1) {
        icon = Icons.star;
      } else if (rating >= i + 0.5) {
        icon = Icons.star_half;
      } else {
        icon = Icons.star_border;
      }
      return Icon(icon, size: size, color: Colors.amber);
    });

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...stars,
        if (showValue) ...[
          const SizedBox(width: 4),
          Text(rating.toStringAsFixed(1),
              style: TextStyle(fontSize: size * 0.8)),
        ],
      ],
    );
  }
}
