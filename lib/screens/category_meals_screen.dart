import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  CategoryMealsScreen(this.meals);

  final List<Meal> meals;

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
    ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = routeArgs['title'];

    final categoryID = routeArgs['id'];
    displayedMeals = widget.meals
        .where((meal) => meal.categories.contains(categoryID))
        .toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealID) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealID);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) {
          final meal = displayedMeals[i];
          return MealItem(
            id: meal.id,
            title: meal.title,
            imageURL: meal.imageURL,
            affordability: meal.affordability,
            complexity: meal.complexity,
            duration: meal.duration,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
