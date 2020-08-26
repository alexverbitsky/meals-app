import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryID = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryID))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          final meal = categoryMeals[i];
          return MealItem(
            title: meal.title,
            imageURL: meal.imageURL,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
