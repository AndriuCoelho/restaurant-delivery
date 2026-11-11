import 'package:flutter/material.dart';
import 'package:guia_restaurantes/models/restaurant.dart';
import 'package:guia_restaurantes/viewmodels/home_viewmodel.dart';
import 'package:guia_restaurantes/views/widgets/restaurant_card.dart';

class HomePage extends StatefulWidget {

  const HomePage({
    super.key
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _viewModel = HomeViewmodel();

  bool _isLoading = true;  // a tela já abre carregando
  String? _errorMessage;   // null enquanto não houver erro

  @override
  void initState() {
    super.initState();
    _loadRestaurants();   // busca os dados uma única vez, ao abrir o app
  }

  Future<void> _loadRestaurants() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // pede os restaurantes ao ViewModel e ESPERA  a resposta
    final error = await _viewModel.loadRestaurants();

    // se a tela foi fechada durante a espera, para aqui
    if (!mounted) return;

    setState(() {
      _isLoading = false;
      _errorMessage = error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurantes'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // 1. carregando
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // 2. erro
    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(_errorMessage!),
            const SizedBox(height: 12,),
            TextButton(
                onPressed: _loadRestaurants,
                child: const Text('Tentar novamente')
            )
          ],
        ),
      );
    }


    // 3. sucesso: lista de restaurantes
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          for (var restaurant in _viewModel.restaurants)
            RestaurantCard(restaurant: restaurant)
        ],
      ),
    );
  }
}