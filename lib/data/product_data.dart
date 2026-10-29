import '../models/product.dart';

/// Categories shown in the filter chips ('All' shows every product).
const List<String> categories = [
  'All',
  'Electronics',
  'Fashion',
  'Home',
  'Sports',
];

/// Sample catalog data (no network images - emojis are used instead).
const List<Product> products = [
  Product(
    id: 1,
    name: 'Smartphone X',
    category: 'Electronics',
    price: 24999,
    rating: 4.5,
    emoji: '📱',
    description:
        'A 6.5-inch AMOLED smartphone with a triple camera and all-day battery.',
  ),
  Product(
    id: 2,
    name: 'Laptop Pro 14',
    category: 'Electronics',
    price: 74999,
    rating: 4.7,
    emoji: '💻',
    description:
        'A thin and light laptop with 16 GB RAM, 512 GB SSD and a 14-inch display.',
  ),
  Product(
    id: 3,
    name: 'Wireless Headphones',
    category: 'Electronics',
    price: 3499,
    rating: 4.2,
    emoji: '🎧',
    description:
        'Over-ear Bluetooth headphones with noise cancellation and 30-hour playback.',
  ),
  Product(
    id: 4,
    name: 'Smart Watch',
    category: 'Electronics',
    price: 5999,
    rating: 4.0,
    emoji: '⌚',
    description:
        'Fitness tracking, heart-rate monitor and notifications on your wrist.',
  ),
  Product(
    id: 5,
    name: 'Cotton T-Shirt',
    category: 'Fashion',
    price: 499,
    rating: 4.1,
    emoji: '👕',
    description:
        'A soft, breathable 100% cotton round-neck T-shirt for everyday wear.',
  ),
  Product(
    id: 6,
    name: 'Denim Jeans',
    category: 'Fashion',
    price: 1299,
    rating: 4.3,
    emoji: '👖',
    description:
        'Slim-fit stretchable denim jeans with a classic five-pocket design.',
  ),
  Product(
    id: 7,
    name: 'Running Shoes',
    category: 'Fashion',
    price: 2499,
    rating: 4.6,
    emoji: '👟',
    description:
        'Lightweight running shoes with cushioned soles and a breathable upper.',
  ),
  Product(
    id: 8,
    name: 'Table Lamp',
    category: 'Home',
    price: 899,
    rating: 3.9,
    emoji: '💡',
    description:
        'A modern LED desk lamp with three brightness levels and a flexible neck.',
  ),
  Product(
    id: 9,
    name: 'Cushion Set',
    category: 'Home',
    price: 1199,
    rating: 4.4,
    emoji: '🛋️',
    description:
        'A set of four plush sofa cushions with washable covers in pastel colours.',
  ),
  Product(
    id: 10,
    name: 'Coffee Mug',
    category: 'Home',
    price: 299,
    rating: 4.8,
    emoji: '☕',
    description: 'A 350 ml ceramic coffee mug that is microwave and dishwasher safe.',
  ),
  Product(
    id: 11,
    name: 'Football',
    category: 'Sports',
    price: 799,
    rating: 4.2,
    emoji: '⚽',
    description: 'A size-5 match football with durable stitching for all surfaces.',
  ),
  Product(
    id: 12,
    name: 'Tennis Racket',
    category: 'Sports',
    price: 3299,
    rating: 4.5,
    emoji: '🎾',
    description: 'A lightweight graphite tennis racket with a comfortable grip.',
  ),
  Product(
    id: 13,
    name: 'Yoga Mat',
    category: 'Sports',
    price: 699,
    rating: 4.3,
    emoji: '🧘',
    description: 'A 6 mm anti-slip yoga mat with a carrying strap.',
  ),
];
