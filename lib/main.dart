import 'package:flutter/material.dart';

import 'screens/catalog_screen.dart';

void main() {
  runApp(const ECommerceCatalogApp());
}

/// Root widget: sets up MaterialApp with a Material 3 theme.
class ECommerceCatalogApp extends StatelessWidget {
  const ECommerceCatalogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopEase Catalog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const CatalogScreen(),
    );
  }
}
