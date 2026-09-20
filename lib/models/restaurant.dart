class Restaurant {
  final String name;
  final String initials;
  final String avatarColorHex;
  final double rating;
  final int reviewsCount;
  final int deliveryTimeMin;
  final int deliveryTimeMax;
  final double deliveryFee;

  const Restaurant({
    required this.name,
    required this.initials,
    required this.avatarColorHex,
    required this.rating,
    required this.reviewsCount,
    required this.deliveryTimeMin,
    required this.deliveryTimeMax,
    required this.deliveryFee
  });
}

const List<Restaurant> restaurantMock = [
  Restaurant(
      name: 'La pasta - Estância',
      initials: 'LP',
      avatarColorHex: '0xFFFFE14D',
      rating: 4.8,
      reviewsCount: 320,
      deliveryTimeMin: 35,
      deliveryTimeMax: 45,
      deliveryFee: 9.00
  ),
  Restaurant(
      name: 'Sushi Go',
      initials: 'SG',
      avatarColorHex: '0xFFFA8072',
      rating: 5.0,
      reviewsCount: 510,
      deliveryTimeMin: 40,
      deliveryTimeMax: 45,
      deliveryFee: 7.00
  ),
];





































