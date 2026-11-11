import 'package:guia_restaurantes/data/network/requester.dart';

class RestaurantService {

  final Requester _requester = Requester();

  Future<Map<String, dynamic>> getRestaurants() async {
    final response = await _requester.get('/api/v1/restaurants');
    return response as Map<String, dynamic>;
  }
}