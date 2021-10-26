import 'package:flutter/material.dart';
import 'package:flutter_course_three_meals_app/components/main_drawer.dart';
import 'package:flutter_course_three_meals_app/screens/filters/components/filters_body.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters-screen';

  final Map<String, bool> filters;
  final void Function(Map<String, bool>) setFilters;

  const FiltersScreen({
    Key? key,
    required this.setFilters,
    required this.filters,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool glutenFree = false;
  bool vegetarian = false;
  bool vegan = false;
  bool lactoseFree = false;

  void onSwitchChange(String type, bool value) {
    setState(() {
      switch (type) {
        case 'glutenFree':
          glutenFree = value;
          break;
        case 'vegetarian':
          vegetarian = value;
          break;
        case 'vegan':
          vegan = value;
          break;
        case 'lactoseFree':
          lactoseFree = value;
          break;
        default:
      }
    });
  }

  @override
  void initState() {
    super.initState();
    glutenFree = widget.filters['glutenFree'] == true;
    vegetarian = widget.filters['vegetarian'] == true;
    vegan = widget.filters['vegan'] == true;
    lactoseFree = widget.filters['lactoseFree'] == true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () => widget.setFilters({
              'glutenFree': glutenFree,
              'vegetarian': vegetarian,
              'vegan': vegan,
              'lactoseFree': lactoseFree,
            }),
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: FiltersBody(
        glutenFree: glutenFree,
        lactoseFree: lactoseFree,
        vegan: vegan,
        vegetarian: vegetarian,
        onSwitchChange: onSwitchChange,
      ),
    );
  }
}
