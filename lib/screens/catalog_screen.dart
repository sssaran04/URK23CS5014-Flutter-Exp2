import 'package:flutter/material.dart';

import '../data/product_data.dart';
import '../models/product.dart';
import '../utils/responsive.dart';
import '../widgets/category_chips.dart';
import '../widgets/product_grid.dart';
import 'product_detail_screen.dart';

/// Main responsive screen of the catalog.
class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCategory = 'All';
  int _navIndex = 0;

  static const _navIcons = [
    Icons.storefront,
    Icons.favorite_border,
    Icons.shopping_cart_outlined,
  ];
  static const _navLabels = ['Shop', 'Wishlist', 'Cart'];

  List<Product> get _filteredProducts => _selectedCategory == 'All'
      ? products
      : products.where((p) => p.category == _selectedCategory).toList();

  void _openDetails(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)),
    );
  }

  Widget _buildCatalog() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryChips(
          categories: categories,
          selected: _selectedCategory,
          onSelected: (c) => setState(() => _selectedCategory = c),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '${_filteredProducts.length} products',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        // Expanded: the grid fills all remaining vertical space.
        Expanded(
          child: ProductGrid(
            products: _filteredProducts,
            onProductTap: _openDetails,
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    if (_navIndex == 0) return _buildCatalog();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_navIcons[_navIndex], size: 64),
          const SizedBox(height: 8),
          Text('${_navLabels[_navIndex]} is empty'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Breakpoints (MediaQuery) decide which navigation pattern to use.
    final isMobile = Responsive.isMobile(context);
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ShopEase Catalog'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        actions: [
          // Adaptive app bar: the view label is shown only on wider screens.
          if (!isMobile)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Chip(
                avatar: Icon(isDesktop ? Icons.desktop_windows : Icons.tablet),
                label: Text(isDesktop ? 'Desktop view' : 'Tablet view'),
              ),
            ),
        ],
      ),
      // Adaptive navigation: NavigationRail beside the content on tablet/desktop.
      body: isMobile
          ? _buildBody()
          : Row(
              children: [
                NavigationRail(
                  selectedIndex: _navIndex,
                  onDestinationSelected: (i) => setState(() => _navIndex = i),
                  // Desktop: extended rail with labels beside the icons.
                  extended: isDesktop,
                  labelType: isDesktop
                      ? NavigationRailLabelType.none
                      : NavigationRailLabelType.all,
                  destinations: [
                    for (var i = 0; i < _navIcons.length; i++)
                      NavigationRailDestination(
                        icon: Icon(_navIcons[i]),
                        label: Text(_navLabels[i]),
                      ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(child: _buildBody()),
              ],
            ),
      // Adaptive navigation: BottomNavigationBar only on mobile.
      bottomNavigationBar: isMobile
          ? BottomNavigationBar(
              currentIndex: _navIndex,
              onTap: (i) => setState(() => _navIndex = i),
              items: [
                for (var i = 0; i < _navIcons.length; i++)
                  BottomNavigationBarItem(
                    icon: Icon(_navIcons[i]),
                    label: _navLabels[i],
                  ),
              ],
            )
          : null,
    );
  }
}
