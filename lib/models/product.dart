class Product {
  final String id;
  final String name;
  final String brand;
  final String category; // smartphone, refurbished, accessory, repair
  final double price;
  final double? originalPrice;
  final String imageUrl;
  final List<String> images;
  final String description;
  final Map<String, String> specs;
  final int stock;
  final bool isFeatured;
  final bool isOffer;
  final String? offerText;
  final String warranty;
  final double rating;
  final int reviewCount;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    this.images = const [],
    required this.description,
    this.specs = const {},
    required this.stock,
    this.isFeatured = false,
    this.isOffer = false,
    this.offerText,
    this.warranty = '1 Year Brand Warranty',
    this.rating = 4.5,
    this.reviewCount = 0,
  });

  bool get inStock => stock > 0;
  bool get hasDiscount => originalPrice != null && originalPrice! > price;
  double get discountPercent =>
      hasDiscount ? ((originalPrice! - price) / originalPrice! * 100) : 0;

  Product copyWith({
    String? id,
    String? name,
    String? brand,
    String? category,
    double? price,
    double? originalPrice,
    String? imageUrl,
    List<String>? images,
    String? description,
    Map<String, String>? specs,
    int? stock,
    bool? isFeatured,
    bool? isOffer,
    String? offerText,
    String? warranty,
    double? rating,
    int? reviewCount,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      images: images ?? this.images,
      description: description ?? this.description,
      specs: specs ?? this.specs,
      stock: stock ?? this.stock,
      isFeatured: isFeatured ?? this.isFeatured,
      isOffer: isOffer ?? this.isOffer,
      offerText: offerText ?? this.offerText,
      warranty: warranty ?? this.warranty,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'brand': brand,
        'category': category,
        'price': price,
        'originalPrice': originalPrice,
        'imageUrl': imageUrl,
        'images': images,
        'description': description,
        'specs': specs,
        'stock': stock,
        'isFeatured': isFeatured,
        'isOffer': isOffer,
        'offerText': offerText,
        'warranty': warranty,
        'rating': rating,
        'reviewCount': reviewCount,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        name: json['name'],
        brand: json['brand'],
        category: json['category'],
        price: (json['price'] as num).toDouble(),
        originalPrice: json['originalPrice'] != null
            ? (json['originalPrice'] as num).toDouble()
            : null,
        imageUrl: json['imageUrl'],
        images: List<String>.from(json['images'] ?? []),
        description: json['description'],
        specs: Map<String, String>.from(json['specs'] ?? {}),
        stock: json['stock'],
        isFeatured: json['isFeatured'] ?? false,
        isOffer: json['isOffer'] ?? false,
        offerText: json['offerText'],
        warranty: json['warranty'] ?? '1 Year Brand Warranty',
        rating: (json['rating'] as num?)?.toDouble() ?? 4.5,
        reviewCount: json['reviewCount'] ?? 0,
      );
}
