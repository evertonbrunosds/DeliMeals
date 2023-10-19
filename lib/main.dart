import 'package:deli_meals/data/dummy_data.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:deli_meals/models/settings.dart';
import 'package:deli_meals/screens/categories_meals_screen.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import 'package:deli_meals/screens/settings_screen.dart';
import 'package:deli_meals/screens/tabs_screen.dart';
import 'package:deli_meals/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({super.key});
  final theme = ThemeData(
    //COR DE FUNDO DA APLICAÇÃO
    canvasColor: const Color.fromRGBO(255, 254, 229, 1),
    fontFamily: 'Raleway',
    textTheme: ThemeData.light().textTheme.copyWith(
          titleMedium: const TextStyle(
            fontFamily: 'Roboto Condensed',
            fontSize: 20,
          ),
        ),
  );
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  void _filterMeals(final Settings settings) {
    setState(() {
      _availableMeals = dummyMeals.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(final Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: widget.theme.copyWith(
        colorScheme: widget.theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.HOME: (_) => TabsScreen(favoriteMeals: _favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (_) =>
            CategoriesMealsScreen(meals: _availableMeals),
        AppRoutes.MEAL_DETAIL: (_) =>
            MealDetailScreen(onToggleFavorite: _toggleFavorite),
        AppRoutes.SETTINGS: (_) =>
            SettingsScreen(onSettingsChange: _filterMeals, settings: settings),
      },
      //SE UMA ROTA NÃO FOR ENCONTRADA, SOMOS DIRECIONADOS A OUTRA ROTA
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      // },
      //SE UMA ROTA NÃO ATENDE UM REQUISITO ESTABELECIDO POR MIM
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       return settings.arguments == 'abc'
      //           ? const Scaffold()
      //           : const CategoriesMealsScreen();
      //     },
      //   );
      // },
    );
  }
}
