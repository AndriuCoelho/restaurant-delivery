import 'package:guia_restaurantes/data/network/requester.dart';
import 'package:guia_restaurantes/data/repositories/restaurant_repository.dart';
import 'package:guia_restaurantes/models/restaurant.dart';

class HomeViewmodel {

  final RestaurantRepository _repository = RestaurantRepository();
  List<Restaurant> restaurants = [];

  Future<String?> loadRestaurants() async {
    try {
      restaurants = await _repository.fetchRestaurants();
      return null;
    } on RequestException catch (e) {
      return e.message;
    } catch (_) {
      return 'Não foi possível carregar os restaurantes.';
    }
  }
}