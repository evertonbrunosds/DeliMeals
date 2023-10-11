import 'package:deli_meals/components/meal_item.dart';
import 'package:deli_meals/data/dummy_data.dart';
import 'package:deli_meals/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  const CategoriesMealsScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;
    final categoriesMeals = dummyMeals.where((meal) {
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
