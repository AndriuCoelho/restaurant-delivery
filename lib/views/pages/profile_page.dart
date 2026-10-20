import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {

  static const _ifoodRed = Color(0xFFEA1D2C);

  const ProfilePage({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildHeader(),
                ],
              ),
            )
        )
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Falta pouco para matar a sua fome!',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Icon(Icons.shopping_bag, size: 90, color: _ifoodRed)
      ],
    );
  }
}