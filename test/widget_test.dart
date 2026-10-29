import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ecommerce_catalog/main.dart';
import 'package:ecommerce_catalog/models/cart.dart';

void main() {
  testWidgets('Catalog shows title and a product', (WidgetTester tester) async {
    await tester.pumpWidget(const ECommerceCatalogApp());

    expect(find.text('ShopEase Catalog'), findsOneWidget);
    expect(find.text('Smartphone X'), findsOneWidget);
  });

  testWidgets('Add to Cart puts the product in the cart', (tester) async {
    cart.clear();
    await tester.pumpWidget(const ECommerceCatalogApp());

    await tester.tap(find.text('Smartphone X'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Add to Cart'));
    await tester.pump();
    expect(cart.itemCount, 1);

    await tester.tap(find.byTooltip('Open cart'));
    await tester.pumpAndSettle();
    expect(find.text('Total: Rs. 24999'), findsOneWidget);
    expect(find.text('Smartphone X'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add_circle_outline));
    await tester.pump();
    expect(find.text('Total: Rs. 49998'), findsOneWidget);

    await tester.pump(const Duration(seconds: 5));
    await tester.pumpAndSettle();
  });
}
