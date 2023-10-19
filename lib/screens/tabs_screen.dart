import 'package:deli_meals/components/main_drawer.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/screens/categories_screen.dart';
import 'package:deli_meals/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key, required this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabScreenManager {
  final String title;
  final Widget screen;
  const _TabScreenManager({
    required this.title,
    required this.screen,
  });
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<_TabScreenManager> _tabScreenManagerList;

  void _selectedScreen(final int index) {
    setState(() => _selectedScreenIndex = index);
  }

  @override
  void initState() {
    super.initState();
    _tabScreenManagerList = [
      const _TabScreenManager(
        title: 'Lista de Categorias',
        screen: CategoriesScreen(),
      ),
      _TabScreenManager(
        title: 'Meus Favoritos',
        screen: FavoriteScreen(favoriteMeals: widget.favoriteMeals),
      ),
    ];
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tabScreenManagerList[_selectedScreenIndex].title),
      ),
      drawer: const MainDrawer(),
      body: _tabScreenManagerList[_selectedScreenIndex].screen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedScreen,
        backgroundColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          )
        ],
      ),
    );
  }
}
