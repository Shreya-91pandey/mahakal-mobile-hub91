import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductService extends ChangeNotifier {
  final List<Product> _products = [];
  bool _isAdminLoggedIn = false;

  // Shop owner WhatsApp number (change this)
  static const String shopWhatsApp = '919876543210'; // Replace with real number
  static const String shopName = 'Mahakal Mobile Hub';
  static const String shopAddress = 'Indore, Madhya Pradesh';

  List<Product> get products => List.unmodifiable(_products);
  bool get isAdminLoggedIn => _isAdminLoggedIn;

  List<Product> get smartphones =>
      _products.where((p) => p.category == 'smartphone').toList();
  List<Product> get refurbished =>
      _products.where((p) => p.category == 'refurbished').toList();
  List<Product> get accessories =>
      _products.where((p) => p.category == 'accessory').toList();
  List<Product> get repairs =>
      _products.where((p) => p.category == 'repair').toList();
  List<Product> get featured =>
      _products.where((p) => p.isFeatured).toList();
  List<Product> get offers =>
      _products.where((p) => p.isOffer).toList();

  ProductService() {
    _loadSampleData();
  }

  void _loadSampleData() {
    _products.addAll([
      // ========== NEW SMARTPHONES ==========
      Product(
        id: 'p1',
        name: 'Samsung Galaxy S24 Ultra',
        brand: 'Samsung',
        category: 'smartphone',
        price: 109999,
        originalPrice: 129999,
        imageUrl: 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
        images: [
          'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=400',
          'https://images.unsplash.com/photo-1592899677977-9c10ca588bbd?w=400',
        ],
        description:
            'Flagship experience with 200MP camera, S-Pen, Snapdragon 8 Gen 3 and stunning Dynamic AMOLED 2X display. Perfect for power users.',
        specs: {
          'Display': '6.8" Dynamic AMOLED 2X',
          'Processor': 'Snapdragon 8 Gen 3',
          'RAM': '12 GB',
          'Storage': '256 GB',
          'Camera': '200MP + 50MP + 12MP + 10MP',
          'Battery': '5000 mAh',
          'OS': 'Android 14',
        },
        stock: 8,
        isFeatured: true,
        isOffer: true,
        offerText: '₹20,000 OFF',
        warranty: '1 Year Samsung Warranty',
        rating: 4.8,
        reviewCount: 1240,
      ),
      Product(
        id: 'p2',
        name: 'iPhone 15 Pro Max',
        brand: 'Apple',
        category: 'smartphone',
        price: 134900,
        originalPrice: 159900,
        imageUrl: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=400',
        description:
            'Titanium design, A17 Pro chip, 48MP camera system and Action Button. The ultimate iPhone experience.',
        specs: {
          'Display': '6.7" Super Retina XDR',
          'Processor': 'A17 Pro',
          'RAM': '8 GB',
          'Storage': '256 GB',
          'Camera': '48MP + 12MP + 12MP',
          'Battery': 'Up to 29 hrs video',
          'OS': 'iOS 17',
        },
        stock: 5,
        isFeatured: true,
        isOffer: true,
        offerText: '₹25,000 OFF',
        warranty: '1 Year Apple Warranty',
        rating: 4.9,
        reviewCount: 2100,
      ),
      Product(
        id: 'p3',
        name: 'OnePlus 12',
        brand: 'OnePlus',
        category: 'smartphone',
        price: 59999,
        originalPrice: 69999,
        imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400',
        description:
            'Hasselblad camera, 100W SUPERVOOC charging, Snapdragon 8 Gen 3. Flagship killer at best price.',
        specs: {
          'Display': '6.82" LTPO AMOLED 120Hz',
          'Processor': 'Snapdragon 8 Gen 3',
          'RAM': '12 GB',
          'Storage': '256 GB',
          'Camera': '50MP + 64MP + 48MP',
          'Battery': '5400 mAh',
          'OS': 'OxygenOS 14',
        },
        stock: 12,
        isFeatured: true,
        isOffer: true,
        offerText: '₹10,000 OFF',
        warranty: '1 Year OnePlus Warranty',
        rating: 4.7,
        reviewCount: 890,
      ),
      Product(
        id: 'p4',
        name: 'Xiaomi 14',
        brand: 'Xiaomi',
        category: 'smartphone',
        price: 54999,
        originalPrice: 64999,
        imageUrl: 'https://images.unsplash.com/photo-1598327105666-5b89351aff97?w=400',
        description:
            'Leica optics, Snapdragon 8 Gen 3, hyper-charging. Premium experience without the premium price.',
        specs: {
          'Display': '6.36" LTPO OLED',
          'Processor': 'Snapdragon 8 Gen 3',
          'RAM': '12 GB',
          'Storage': '256 GB',
          'Camera': '50MP Leica Triple',
          'Battery': '4610 mAh',
          'OS': 'HyperOS',
        },
        stock: 15,
        isFeatured: false,
        isOffer: true,
        offerText: 'Special Price',
        warranty: '1 Year Xiaomi Warranty',
        rating: 4.6,
        reviewCount: 650,
      ),
      Product(
        id: 'p5',
        name: 'Realme GT 6',
        brand: 'Realme',
        category: 'smartphone',
        price: 37999,
        originalPrice: 42999,
        imageUrl: 'https://images.unsplash.com/photo-1585060544812-6b45742d762f?w=400',
        description:
            'Flagship performance under 40k. 120Hz display, 50MP Sony camera and 100W charging.',
        specs: {
          'Display': '6.78" 120Hz AMOLED',
          'Processor': 'Snapdragon 8s Gen 3',
          'RAM': '8 GB',
          'Storage': '256 GB',
          'Camera': '50MP + 8MP + 2MP',
          'Battery': '5500 mAh',
          'OS': 'Realme UI 5.0',
        },
        stock: 20,
        isFeatured: true,
        warranty: '1 Year Realme Warranty',
        rating: 4.5,
        reviewCount: 420,
      ),
      Product(
        id: 'p6',
        name: 'Vivo V30 Pro',
        brand: 'Vivo',
        category: 'smartphone',
        price: 41999,
        imageUrl: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=400',
        description:
            'Stunning design, Aura Light portrait camera and 80W fast charging. Perfect for content creators.',
        specs: {
          'Display': '6.78" 120Hz AMOLED',
          'Processor': 'Dimensity 8200',
          'RAM': '8 GB',
          'Storage': '256 GB',
          'Camera': '50MP ZEISS Triple',
          'Battery': '5000 mAh',
          'OS': 'Funtouch OS 14',
        },
        stock: 10,
        warranty: '1 Year Vivo Warranty',
        rating: 4.4,
        reviewCount: 310,
      ),

      // ========== REFURBISHED ==========
      Product(
        id: 'r1',
        name: 'iPhone 13 (Refurbished)',
        brand: 'Apple',
        category: 'refurbished',
        price: 38999,
        originalPrice: 59900,
        imageUrl: 'https://images.unsplash.com/photo-1632661674597-1d0d4b5c8e8a?w=400',
        description:
            'Grade A refurbished. Fully tested, 90+ battery health, 6 months warranty. Looks almost new.',
        specs: {
          'Condition': 'Grade A - Excellent',
          'Battery Health': '92%',
          'Storage': '128 GB',
          'Color': 'Midnight',
          'Warranty': '6 Months Store Warranty',
        },
        stock: 6,
        isFeatured: true,
        isOffer: true,
        offerText: 'Best Value',
        warranty: '6 Months Store Warranty',
        rating: 4.6,
        reviewCount: 180,
      ),
      Product(
        id: 'r2',
        name: 'Samsung Galaxy S22 (Refurbished)',
        brand: 'Samsung',
        category: 'refurbished',
        price: 28999,
        originalPrice: 72999,
        imageUrl: 'https://images.unsplash.com/photo-1610945265064-0e34e5519bbf?w=400',
        description:
            'Premium flagship at half price. Fully restored, original parts, 6 months warranty.',
        specs: {
          'Condition': 'Grade A',
          'Battery Health': '88%',
          'Storage': '128 GB',
          'Color': 'Phantom Black',
        },
        stock: 4,
        isOffer: true,
        offerText: 'Huge Savings',
        warranty: '6 Months Store Warranty',
        rating: 4.5,
        reviewCount: 95,
      ),
      Product(
        id: 'r3',
        name: 'OnePlus 9 Pro (Refurbished)',
        brand: 'OnePlus',
        category: 'refurbished',
        price: 24999,
        originalPrice: 64999,
        imageUrl: 'https://images.unsplash.com/photo-1565849904461-04a58ad377e0?w=400',
        description:
            'Hasselblad camera, 120Hz Fluid AMOLED. Excellent condition with warranty.',
        specs: {
          'Condition': 'Grade A',
          'Storage': '256 GB',
          'RAM': '12 GB',
        },
        stock: 3,
        warranty: '6 Months Store Warranty',
        rating: 4.4,
        reviewCount: 67,
      ),

      // ========== ACCESSORIES ==========
      Product(
        id: 'a1',
        name: '65W SuperVOOC Charger',
        brand: 'OnePlus',
        category: 'accessory',
        price: 1999,
        originalPrice: 2499,
        imageUrl: 'https://images.unsplash.com/photo-1583394838336-acd977736f90?w=400',
        description: 'Original OnePlus 65W fast charger with Type-C cable. Compatible with most Android phones.',
        specs: {
          'Power': '65W',
          'Cable': 'Type-C to Type-C',
          'Compatibility': 'Most Android phones',
        },
        stock: 30,
        isOffer: true,
        offerText: '20% OFF',
        warranty: '6 Months',
        rating: 4.7,
        reviewCount: 520,
      ),
      Product(
        id: 'a2',
        name: 'Boat Airdopes 141',
        brand: 'boAt',
        category: 'accessory',
        price: 1299,
        originalPrice: 4490,
        imageUrl: 'https://images.unsplash.com/photo-1606220588913-b3aacb4d2f46?w=400',
        description: 'True wireless earbuds with 42 hours playback, IPX4 water resistance and immersive sound.',
        specs: {
          'Playback': '42 Hours',
          'Driver': '8mm',
          'Water Resistance': 'IPX4',
          'Bluetooth': '5.1',
        },
        stock: 45,
        isFeatured: true,
        isOffer: true,
        offerText: 'Hot Deal',
        warranty: '1 Year',
        rating: 4.3,
        reviewCount: 8900,
      ),
      Product(
        id: 'a3',
        name: 'Spigen Tough Armor Case (S24)',
        brand: 'Spigen',
        category: 'accessory',
        price: 1499,
        imageUrl: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=400',
        description: 'Military-grade protection with kickstand. Perfect fit for Samsung Galaxy S24 series.',
        specs: {
          'Material': 'TPU + PC',
          'Protection': 'Military Grade',
          'Compatible': 'Galaxy S24 / S24+',
        },
        stock: 25,
        warranty: '1 Year',
        rating: 4.6,
        reviewCount: 340,
      ),
      Product(
        id: 'a4',
        name: 'Anker Power Bank 20000mAh',
        brand: 'Anker',
        category: 'accessory',
        price: 2499,
        originalPrice: 3499,
        imageUrl: 'https://images.unsplash.com/photo-1609091839311-b95d0aed0b0b?w=400',
        description: 'High capacity power bank with 22.5W fast charging and dual ports.',
        specs: {
          'Capacity': '20000 mAh',
          'Output': '22.5W',
          'Ports': '2 USB-A + 1 Type-C',
        },
        stock: 18,
        isOffer: true,
        offerText: '₹1000 OFF',
        warranty: '18 Months',
        rating: 4.8,
        reviewCount: 1200,
      ),
      Product(
        id: 'a5',
        name: 'Tempered Glass (All Models)',
        brand: 'Generic',
        category: 'accessory',
        price: 299,
        originalPrice: 499,
        imageUrl: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?w=400',
        description: '9H hardness tempered glass with edge-to-edge protection. Available for all popular models.',
        specs: {
          'Hardness': '9H',
          'Thickness': '0.33mm',
          'Compatibility': 'Most phones',
        },
        stock: 100,
        isOffer: true,
        offerText: 'Buy 2 Get 1',
        warranty: 'No Warranty',
        rating: 4.2,
        reviewCount: 2100,
      ),

      // ========== REPAIR SERVICES ==========
      Product(
        id: 'rp1',
        name: 'Screen Replacement (Any Model)',
        brand: 'Mahakal Service',
        category: 'repair',
        price: 2499,
        imageUrl: 'https://images.unsplash.com/photo-1580910051074-3eb694886505?w=400',
        description:
            'Professional screen replacement using original or high-quality compatible displays. 90-day warranty on parts.',
        specs: {
          'Time': '30-90 minutes',
          'Warranty': '90 Days on parts',
          'Models': 'All major brands',
        },
        stock: 999,
        isFeatured: true,
        warranty: '90 Days',
        rating: 4.7,
        reviewCount: 450,
      ),
      Product(
        id: 'rp2',
        name: 'Battery Replacement',
        brand: 'Mahakal Service',
        category: 'repair',
        price: 1499,
        imageUrl: 'https://images.unsplash.com/photo-1609599006353-e629aaabfeae?w=400',
        description:
            'Genuine capacity battery replacement. Improves backup significantly. Same day service available.',
        specs: {
          'Time': '20-40 minutes',
          'Warranty': '6 Months',
        },
        stock: 999,
        warranty: '6 Months',
        rating: 4.6,
        reviewCount: 320,
      ),
      Product(
        id: 'rp3',
        name: 'Software / Flashing Service',
        brand: 'Mahakal Service',
        category: 'repair',
        price: 799,
        imageUrl: 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=400',
        description:
            'Stuck on logo, bootloop, software issues? We flash official firmware safely. Data recovery possible in many cases.',
        specs: {
          'Time': '30-60 minutes',
          'Data': 'Attempt recovery',
        },
        stock: 999,
        warranty: 'No Warranty',
        rating: 4.5,
        reviewCount: 210,
      ),
      Product(
        id: 'rp4',
        name: 'Water Damage Repair',
        brand: 'Mahakal Service',
        category: 'repair',
        price: 1999,
        imageUrl: 'https://images.unsplash.com/photo-1556656793-08538906a9f8?w=400',
        description:
            'Specialized water damage recovery. Ultrasonic cleaning + component level repair. Success rate high if brought quickly.',
        specs: {
          'Time': '1-3 days',
          'Success Rate': 'High if early',
        },
        stock: 999,
        warranty: '30 Days',
        rating: 4.3,
        reviewCount: 95,
      ),
    ]);
  }

  // ========== ADMIN METHODS ==========
  bool adminLogin(String password) {
    // Default password: mahakal@123  (change this!)
    if (password == 'mahakal@123') {
      _isAdminLoggedIn = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  void adminLogout() {
    _isAdminLoggedIn = false;
    notifyListeners();
  }

  void addProduct(Product product) {
    _products.insert(0, product);
    notifyListeners();
  }

  void updateProduct(Product updated) {
    final index = _products.indexWhere((p) => p.id == updated.id);
    if (index != -1) {
      _products[index] = updated;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  void updateStock(String id, int newStock) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = _products[index].copyWith(stock: newStock);
      notifyListeners();
    }
  }

  void updatePrice(String id, double newPrice, {double? originalPrice}) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index != -1) {
      _products[index] = _products[index].copyWith(
        price: newPrice,
        originalPrice: originalPrice,
      );
      notifyListeners();
    }
  }

  List<Product> search(String query) {
    if (query.isEmpty) return products;
    final q = query.toLowerCase();
    return _products
        .where((p) =>
            p.name.toLowerCase().contains(q) ||
            p.brand.toLowerCase().contains(q) ||
            p.category.toLowerCase().contains(q) ||
            p.description.toLowerCase().contains(q))
        .toList();
  }

  List<Product> getByCategory(String category) {
    if (category == 'all') return products;
    return _products.where((p) => p.category == category).toList();
  }
}
