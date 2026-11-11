class Restaurant {
  final String id;             // NOVO
  final String name;
  final String category;       // NOVO
  final String initials;
  final double rating;
  final int ratingCount;        // era reviewsCount
  final String deliveryTime;    // era deliveryTimeMin + deliveryTimeMax
  final double deliveryFee;
  final String description;     // NOVO

  const Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.initials,
    required this.rating,
    required this.ratingCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.description
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      initials: json['initials'] as String,
      rating: (json['rating'] as num).toDouble(),
      ratingCount: json['rating_count'] as int,
      deliveryTime: json['delivery_time'] as String,
      deliveryFee: (json['delivery_fee'] as num).toDouble(),
      description: json['description'] as String,
    );
  }

  String get deliveryInfo =>
      '$deliveryTime - R\$ ${deliveryFee.toStringAsFixed(2).replaceAll('.', ',')}';

}