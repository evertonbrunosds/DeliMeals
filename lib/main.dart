import 'package:deli_meals/screens/categories_meals_screen.dart';
import 'package:deli_meals/screens/meal_detail_screen.dart';
import 'package:deli_meals/screens/settings_screen.dart';
import 'package:deli_meals/screens/tabs_screen.dart';
import 'package:deli_meals/utils/app_routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
  MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeals',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
      routes: {
        AppRoutes.HOME: (_) => const TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (_) => const CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (_) => const MealDetailScreen(),
        AppRoutes.SETTINGS: (_) => const SettingsScreen(),
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
