import 'package:flutter/material.dart';
import './screens/categories_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import './dummy_data.dart';
import './models/meal.dart';
void main()=>runApp(const MyApp());
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String,bool>? _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];
  void _setFilters(Map<String,bool> filters){
      setState((){
        _filters = filters;
        _availableMeals = dummyMeals.where((meal){
          if(_filters!['gluten']! && !meal.isGlutenFree){
            return false;
          }
          if(_filters!['lactose']! && !meal.isLactoseFree){
            return false;
          }if(_filters!['vegan']! && !meal.isVegan){
            return false;
          }if(_filters!['vegetarian']! && !meal.isVegeterian){
            return false;
          }
          return true;
        }).toList();
      });
  }
  void _toggleFavorite(String mealId){
    final existingIndex = _favoriteMeals.indexWhere((meal)=> meal.id == mealId);
    if(existingIndex >= 0){
      setState((){
        _favoriteMeals.removeAt(existingIndex);
      });
    }
    else{
      _favoriteMeals.add(dummyMeals.firstWhere((element) => element.id == mealId));
    }
  }
  bool _isMealFavorite(String id){
    return _favoriteMeals.any((element) => element.id == id);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          title: 'DeliMeals',
          theme: ThemeData(
            fontFamily: 'OpenSans',
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.pink,
              accentColor: Colors.amber,
            ),
            textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              titleLarge: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      //home: const CategoriesScreen(),
      initialRoute: '/',
      routes: {
            '/' : (ctx) => TabsScreen(favoriteMeals: _favoriteMeals),
            CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(availableMeals: _availableMeals),
            MealDetailScreen.routeName : (ctx) => MealDetailScreen(toggleFavorite: _toggleFavorite,isFavorite: _isMealFavorite,),
            FiltersScreen.routeName : (ctx) => FiltersScreen(currentFilters: _filters!,saveFilters: _setFilters),
      },
      onGenerateRoute: (settings){
            return MaterialPageRoute(builder: (ctx)=> const CategoriesScreen());
      },
      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=> const CategoriesScreen());
      },
    );
  }
}


