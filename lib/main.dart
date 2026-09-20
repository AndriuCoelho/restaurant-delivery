import 'package:flutter/material.dart';
import 'package:guia_restaurantes/models/restaurant.dart';
import 'package:guia_restaurantes/views/widgets/restaurant_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guia de Restaurantes',
      home: Scaffold(
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
          )
      ),
    );
  }
}

