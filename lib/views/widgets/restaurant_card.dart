import 'package:flutter/material.dart';
import 'package:guia_restaurantes/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {

  final Restaurant restaurant;

  const RestaurantCard({ super.key, required this.restaurant });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Color(int.parse(restaurant.avatarColorHex)),
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
                    Text('${restaurant.reviewsCount}', style: TextStyle(color: Colors.grey))
                  ],
                ),
                Text('40-50 min - R\$ 7,00', style: TextStyle(color: Colors.grey[70]))
              ],
            )
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }

}