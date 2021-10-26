import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/screens/categories/components/categories_item.dart';
import 'package:flutter_course_three_meals_app/utils/dummy_data.dart';

class CategoriesBody extends StatelessWidget {
  const CategoriesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...DUMMY_CATEGORIES
            .map((e) => CategoriesItem(
                  title: e.title,
                  color: e.color,
                  id: e.id,
                ))
            .toList(),
      ],
    );
  }
}
