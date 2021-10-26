import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/models/meal.dart';

class MealDetailBody extends StatelessWidget {
  final Meal meal;

  const MealDetailBody({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildListContainer(
            ListView.builder(
              itemBuilder: (_, index) => Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    meal.ingredients[index],
                  ),
                ),
              ),
              itemCount: meal.ingredients.length,
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildListContainer(
            ListView.builder(
              itemBuilder: (_, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('#${index + 1}'),
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  const Divider(),
                ],
              ),
              itemCount: meal.steps.length,
            ),
          ),
        ],
      ),
    );
  }

  Container buildListContainer(Widget child) {
    return Container(
      height: 200,
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  Container buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
