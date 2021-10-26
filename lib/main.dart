import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/models/meal.dart';
import 'package:flutter_course_three_meals_app/screens/categories/categories_screen.dart';
import 'package:flutter_course_three_meals_app/screens/category_meals/category_meals_screen.dart';
import 'package:flutter_course_three_meals_app/screens/filters/filters_screen.dart';
import 'package:flutter_course_three_meals_app/screens/homepage/homepage_screen.dart';
import 'package:flutter_course_three_meals_app/screens/meal_detail/meal_detail_screen.dart';
import 'package:flutter_course_three_meals_app/screens/tabs-screen/tabs_screen.dart';
import 'package:flutter_course_three_meals_app/utils/dummy_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'glutenFree': false,
    'vegetarian': false,
    'vegan': false,
    'lactoseFree': false,
  };

  List<Meal> _meals = DUMMY_MEALS;

  List<Meal> _favouriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _meals = DUMMY_MEALS.where((meal) {
        if (_filters['glutenFree'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['lactoseFree'] == true && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavourite(String mealId) {
    final existingIndex =
        _favouriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals.add(_meals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String mealId) {
    return _favouriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
        colorScheme: const ColorScheme.light().copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
                    color: const Color.fromRGBO(20, 51, 51, 1),
                  ),
              bodyText2: ThemeData.light()
                  .textTheme
                  .bodyText2!
                  .copyWith(color: const Color.fromRGBO(20, 51, 51, 1)),
              headline6: ThemeData.light().textTheme.headline6!.copyWith(
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                  ),
            ),
      ),
      // home: const CategoriesScreen(),
      // initialRoute: '/',
      routes: {
        '/': (_) => TabsScreen(favouriteMeals: _favouriteMeals),
        CategoryMealsScreen.routeName: (_) => CategoryMealsScreen(
              meals: _meals,
            ),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
              toggleFavourite: _toggleFavourite,
              isMealFavourite: _isMealFavourite,
            ),
        FiltersScreen.routeName: (_) => FiltersScreen(
              setFilters: _setFilters,
              filters: _filters,
            ),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      // },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(builder: (_) => const CategoriesScreen());
      // },
    );
  }
}
