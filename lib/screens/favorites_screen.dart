import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen(this.favorites);

  final List<Meal> favorites;

  @override
  Widget build(BuildContext context) {
    if (favorites.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, i) {
        final meal = favorites[i];
        return MealItem(
          id: meal.id,
          title: meal.title,
          imageURL: meal.imageURL,
          affordability: meal.affordability,
          complexity: meal.complexity,
          duration: meal.duration,
        );
      },
      itemCount: favorites.length,
    );
  }
}
