import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String,bool> currentFilters;
  const FiltersScreen({Key? key,required this.saveFilters,required this.currentFilters}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool? _glutenFree = false;
  bool? _vegetarian = false;
  bool? _vegan = false;
  bool? _lactoseFree = false;
  @override
  initState(){
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }
  Widget _buildSwitchListTile(String title,String description,var currentValue,Function update){
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: update(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(icon: const Icon(Icons.save),onPressed: (){
            final selectedFilters = {
              'gluten' : _glutenFree,
              'lactose' : _lactoseFree,
              'vegan' : _vegan,
              'vegetarian' : _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          },)
        ],
      ),
      drawer: const MainDrawer(),
      body : Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text('adjust your meal selection',style: Theme.of(context).textTheme.titleLarge,),
          ),
          Expanded(child: ListView(
            children: [
              _buildSwitchListTile('Gluten-Free', 'only include gluten free meals', _glutenFree,(newValue){
                setState((){
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchListTile('Lactose-Free', 'only include Lactose free meals', _lactoseFree,(newValue){
                setState((){
                  _lactoseFree = newValue;
                });
              }),
              _buildSwitchListTile('Vegetarian', 'only include Vegetarian meals', _vegetarian,(newValue){
                setState((){
                  _vegetarian = newValue;
                });
              }),
              _buildSwitchListTile('Vegan', 'only include Vegan meals', _vegan,(newValue){
                setState((){
                  _vegan = newValue;
                });
              }),
            ],
          ))
        ],
      )
    );
  }
}
