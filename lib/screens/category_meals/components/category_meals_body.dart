import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/models/meal.dart';
import 'package:flutter_course_three_meals_app/screens/category_meals/components/meal_card.dart';
import 'package:flutter_course_three_meals_app/utils/dummy_data.dart';

class CategoryMealsBody extends StatefulWidget {
  final String id;
  final List<Meal> meals;

  const CategoryMealsBody({
    Key? key,
    required this.id,
    required this.meals,
  }) : super(key: key);

  @override
  State<CategoryMealsBody> createState() => _CategoryMealsBodyState();
}

class _CategoryMealsBodyState extends State<CategoryMealsBody> {
  List<Meal> meals = [];

  @override
  void initState() {
    super.initState();
    meals = widget.meals
        .where((meal) => meal.categories.contains(widget.id))
        .toList();
  }

  void _removeItem(String mealId) {
    setState(() {
      meals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) => MealCard(
        meal: meals[index],
        removeItem: _removeItem,
      ),
      itemCount: meals.length,
    );
  }
}
