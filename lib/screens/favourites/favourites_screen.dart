import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/models/meal.dart';
import 'package:flutter_course_three_meals_app/screens/category_meals/components/meal_card.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouritesScreen({
    Key? key,
    required this.favouriteMeals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favourite yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) => MealCard(
          meal: favouriteMeals[index],
        ),
        itemCount: favouriteMeals.length,
      );
    }
  }
}
