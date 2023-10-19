import 'package:deli_meals/components/meal_item.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required this.favoriteMeals});
  final List<Meal> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    return favoriteMeals.isEmpty
        ? const Center(
            child: Text('Minhas Refeições Favoritas'),
          )
        : ListView.builder(
            itemCount: favoriteMeals.length,
            itemBuilder: (_, index) {
              return MealItem(meal: favoriteMeals[index]);
            });
  }
}
