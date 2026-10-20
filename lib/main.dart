import 'package:flutter/material.dart';
import 'package:guia_restaurantes/views/pages/home_page.dart';
import 'package:guia_restaurantes/views/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({ super.key });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final _pages = [
      // 0 - Indice 0 tem que mostrar a listagem que já temos
      const HomePage(),

      // 1 - Chamar tela/Widget de Busca
      const Center(child: Text('Tela de Busca de Restaurantes')),

      // 2 - Chamar tela/Widget de Pedidos
      const Center(child: Text('Tela de Pedidos')),

      // 3 - Chamar a tela de Perfil
      const ProfilePage()
    ];

    return MaterialApp(
      title: 'Guia de Restaurantes',
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            destinations: [
              NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Inicio'),
              NavigationDestination(icon: Icon(Icons.search), label: 'Busca'),
              NavigationDestination(icon: Icon(Icons.list), label: 'Pedidos'),
              NavigationDestination(icon: Icon(Icons.person_2_outlined), label: 'Perfil'),
            ]
        ),
      ),
    );
  }
}