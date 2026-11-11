import 'package:flutter/material.dart';
import 'package:guia_restaurantes/models/restaurant.dart';
import 'package:guia_restaurantes/views/pages/restaurant_details_page.dart';

class RestaurantCard extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantCard({ super.key, required this.restaurant });

  static const _avatarColors = [
    Color(0xFFFFE14D),   // amarelo
    Color(0xFFFA8072),   // salmão
    Color(0xFF2E8B3A),   // verde
    Color(0xFF6FA8FF),   // azul
    Color(0xFFB98AF2),   // lilás
  ];

  Color get _avatarColor {
    final number = int.tryParse(restaurant.id) ?? 1;
    return _avatarColors[(number -1) % _avatarColors.length];
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => RestaurantDetailsPage(
                restaurant: restaurant
            )
        ));
      },
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: _avatarColor,
                child: Text(restaurant.initials, style: TextStyle(fontWeight: FontWeight.bold)),
              ),

              SizedBox(width: 14),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(restaurant.name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      Icon(Icons.star, size: 16, color: Colors.black),
                      SizedBox(width: 4),
                      Text('${restaurant.rating}', style: TextStyle(fontWeight: FontWeight.w500)),
                      SizedBox(width: 4),
                      Text('${restaurant.ratingCount}', style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  Text('40-50 min - R\$ 7,00', style: TextStyle(color: Colors.grey[70]))
                ],
              )
            ],
          ),
          SizedBox(height: 10)
        ],
      ),
    );
  }
}