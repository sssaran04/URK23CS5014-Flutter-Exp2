import 'package:flutter_test/flutter_test.dart';

import 'package:ecommerce_catalog/main.dart';

void main() {
  testWidgets('Catalog shows title and a product', (WidgetTester tester) async {
    await tester.pumpWidget(const ECommerceCatalogApp());

    expect(find.text('ShopEase Catalog'), findsOneWidget);
    expect(find.text('Smartphone X'), findsOneWidget);
  });
}
