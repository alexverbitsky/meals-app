import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  FiltersScreen(this.saveFilters, this.currentFilters);

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree;
  bool _vegetarian;
  bool _vegan;
  bool _lactoseFree;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            )
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    title: 'Gluten-free',
                    description: 'Only include gluten-free meals',
                    value: _glutenFree,
                    onChanged: (newValue) =>
                        setState(() => _glutenFree = newValue),
                  ),
                  _buildSwitchListTile(
                    title: 'Lactose-free',
                    description: 'Only include lactose-free meals',
                    value: _lactoseFree,
                    onChanged: (newValue) =>
                        setState(() => _lactoseFree = newValue),
                  ),
                  _buildSwitchListTile(
                    title: 'Vegetarian',
                    description: 'Only include vegetarian meals',
                    value: _vegetarian,
                    onChanged: (newValue) =>
                        setState(() => _vegetarian = newValue),
                  ),
                  _buildSwitchListTile(
                    title: 'Vegan',
                    description: 'Only include vegan meals',
                    value: _vegan,
                    onChanged: (newValue) => setState(() => _vegan = newValue),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildSwitchListTile({
    String title,
    String description,
    bool value,
    Function onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
