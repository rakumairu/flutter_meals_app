import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/models/meal.dart';
import 'package:flutter_course_three_meals_app/screens/meal_detail/components/meal_detail_body.dart';
import 'package:flutter_course_three_meals_app/utils/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final void Function(String) toggleFavourite;
  final bool Function(String) isMealFavourite;

  const MealDetailScreen({
    Key? key,
    required this.toggleFavourite,
    required this.isMealFavourite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final String mealId = routeArgs['id'] as String;
    final Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    final bool isDeleteable = (routeArgs['isDeleteable'] as String) == '1';

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: isDeleteable
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).maybePop(mealId);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ]
            : [],
      ),
      body: MealDetailBody(
        meal: meal,
      ),
      floatingActionButton: FloatingActionButton(
        child: isMealFavourite(mealId)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
        onPressed: () => toggleFavourite(mealId),
      ),
    );
  }
}
