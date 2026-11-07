import 'package:flutter/material.dart';
import 'package:guia_restaurantes/models/restaurant.dart';
import 'package:guia_restaurantes/views/widgets/restaurant_card.dart';

class HomePage extends StatelessWidget {

  const HomePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var restaurant in restaurantMock)
                RestaurantCard(restaurant: restaurant)
            ],
          ),
        ),
      ),
    );
  }
}