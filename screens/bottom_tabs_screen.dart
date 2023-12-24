import 'package:flutter/material.dart';
import '../models/meal.dart';
import 'categories_screen.dart';
import 'favorites_screen.dart';
import '../widgets/main_drawer.dart';
class BottomTabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  const BottomTabsScreen({Key? key,required this.favoriteMeals}) : super(key: key);

  @override
  State<BottomTabsScreen> createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  List<Map<String,dynamic>>? _pages;
  @override
  initState(){
    _pages = [{'page':const CategoriesScreen(),'title' : 'Categories'},{'page':FavoritesScreen(favoriteMeals: widget.favoriteMeals),'title':'Favorites'}];
    super.initState();
  }
  int _selectedPage = 0;
  void selectPage(int index){
    setState((){
      _selectedPage = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedPage]['title']),
      ),
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        backgroundColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _selectedPage,
      //type: BottomNavigationBarType.shifting,
      items:  [
        BottomNavigationBarItem(icon: const Icon(Icons.category,),tooltip: 'All categories',
          backgroundColor: Theme.of(context).primaryColor,
        ),
        BottomNavigationBarItem(icon: const Icon(Icons.star),tooltip: 'Favorites',
        backgroundColor: Theme.of(context).primaryColor,
        ),
      ],
      ),
      body: _pages![_selectedPage]['page'],
    );
  }
}
