import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  final _tabBarView = const TabBarView(
    children: [CategoriesScreen(), FavoriteScreen()],
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabBarView.children.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.category),
                text: 'Favoritos',
              )
            ],
          ),
        ),
        body: _tabBarView,
      ),
    );
  }
}
