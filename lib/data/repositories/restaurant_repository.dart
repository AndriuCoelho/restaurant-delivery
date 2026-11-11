import 'package:guia_restaurantes/data/services/restaurant_service.dart';
import 'package:guia_restaurantes/models/restaurant.dart';

class RestaurantRepository {

  final RestaurantService _service = RestaurantService();

  Future<List<Restaurant>> fetchRestaurants() async {
    // 1. pede ao service a resposta em JSON
    final json = await _service.getRestaurants();

    // 2. pega a lista que vem dentro de "items"
    final items = json['items'] as List;

    // 3. converte cada item num Restaurant
    return items
        .map((item) => Restaurant.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}