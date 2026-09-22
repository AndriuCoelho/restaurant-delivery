import 'package:flutter/material.dart';
import 'package:guia_restaurantes/models/restaurant.dart';

class RestaurantDetailsPage extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantDetailsPage({
    super.key,
    required this.restaurant
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                    'https://images.unsplash.com/photo-1473093295043-cdd812d0e601?w=1200',
                  height: 235,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )
                    ),
                  ),
                ),
                
                Transform.translate(
                  offset: const Offset(0, -32),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Card(
                      child: Column(
                        children: [
                          Text('Teste')
                        ],
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}