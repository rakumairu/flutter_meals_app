import 'package:flutter/material.dart';

class FiltersBody extends StatelessWidget {
  final bool glutenFree;
  final bool vegetarian;
  final bool vegan;
  final bool lactoseFree;

  final void Function(String, bool) onSwitchChange;

  const FiltersBody({
    Key? key,
    required this.glutenFree,
    required this.vegetarian,
    required this.vegan,
    required this.lactoseFree,
    required this.onSwitchChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            'Adjust your meal selection.',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              buildSwitch(
                title: 'Gluten Free',
                subtitle: 'Only includes gluten-free meals.',
                value: glutenFree,
                onChange: (value) {
                  onSwitchChange('glutenFree', value);
                },
              ),
              buildSwitch(
                title: 'Lactose Free',
                subtitle: 'Only includes lactose-free meals.',
                value: lactoseFree,
                onChange: (value) {
                  onSwitchChange('lactoseFree', value);
                },
              ),
              buildSwitch(
                title: 'Vegeteraian',
                subtitle: 'Only includes vegetarian-free meals.',
                value: vegetarian,
                onChange: (value) {
                  onSwitchChange('vegetarian', value);
                },
              ),
              buildSwitch(
                title: 'Vegan',
                subtitle: 'Only includes vegan-free meals.',
                value: vegan,
                onChange: (value) {
                  onSwitchChange('vegan', value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  SwitchListTile buildSwitch({
    required String title,
    required String subtitle,
    required bool value,
    required void Function(bool) onChange,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChange,
    );
  }
}
