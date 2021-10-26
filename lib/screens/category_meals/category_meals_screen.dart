import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/models/meal.dart';
import 'package:flutter_course_three_meals_app/screens/category_meals/components/category_meals_body.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals-screen';
  final List<Meal> meals;
  // final String categoryId;
  // final String categoryTitle;

  const CategoryMealsScreen({
    Key? key,
    required this.meals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs['title'] as String),
      ),
      body: CategoryMealsBody(
        id: routeArgs['id'] as String,
        meals: meals,
      ),
    );
  }
}
