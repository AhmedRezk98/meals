import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  const FavoritesScreen({Key? key,required this.favoriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(favoriteMeals.isEmpty){
      return const Center(
        child: Text('No Items Added start adding some'),
      );
    }
    else{
      return ListView.builder(itemBuilder: (ctx,index){
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          duration: favoriteMeals[index].duration,
          complexity: favoriteMeals[index].complexity,
          affordability: favoriteMeals[index].affordability,
          removeItem: (){},
        );
      },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
