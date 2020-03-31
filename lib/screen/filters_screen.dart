import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filter';
  final Function saveFilters;

  final Map<String, bool> currentFilter;

  const FiltersScreen({Key key, this.saveFilters, this.currentFilter})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilter['gluten'];
    _lactoseFree = widget.currentFilter['lactose'];
    _vegetarian = widget.currentFilter['vegetarian'];
    _vegan = widget.currentFilter['vegan'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
        actions: <Widget>[
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
              })
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              buildSwitchListTile(
                title: 'Gluten-free',
                currentValue: _glutenFree,
                description: 'Only include gluten-free meals',
                updateValue: (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                title: 'Vegetarian',
                currentValue: _vegetarian,
                description: 'Only include Vegetarian meals',
                updateValue: (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                title: 'Vegan',
                currentValue: _vegan,
                description: 'Only include Vegan meals',
                updateValue: (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              buildSwitchListTile(
                title: 'Lactose-free',
                currentValue: _lactoseFree,
                description: 'Only include lactose-free meals',
                updateValue: (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(
      {String title,
      String description,
      bool currentValue,
      Function updateValue}) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }
}
