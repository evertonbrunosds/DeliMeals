import 'package:deli_meals/components/meal_item.dart';
import 'package:deli_meals/models/category.dart';
import 'package:deli_meals/models/meal.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  final List<Meal> meals;
  const CategoriesMealsScreen({super.key, required this.meals});

  @override
  Widget build(final BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoriesMeals = meals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
      ),
      body: ListView.builder(
        itemCount: categoriesMeals.length,
        itemBuilder: (_, index) {
          return MealItem(meal: categoriesMeals[index]);
        },
      ),
    );
  }
}
