import '../screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

import '../models/meal.dart';
class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
  const MealItem(
      {Key? key,required this.removeItem ,required this.id,required this.title, required this.affordability, required this.complexity, required this.imageUrl, required this.duration})
      : super(key: key);

  String? get complexityText {
    switch (complexity) {
      case Complexity.simple :
        return 'simple';
        break;
      case Complexity.challenging :
        return 'challenging';
        break;
      case Complexity.hard :
        return 'hard';
        break;
      default :
        return 'unknown';
    }
  }
  String? get affordabilityText {
    switch (affordability) {
      case Affordability.affordable :
        return 'affordable';
        break;
      case Affordability.pricey :
        return 'pricey';
        break;
      case Affordability.luxorious :
        return 'luxorios';
        break;
      default :
        return 'unknown';
    }
  }
    void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailScreen.routeName,arguments: id).then((result){
      if(result != null){
        removeItem(result);
      }
    });
    }
    @override
    Widget build(BuildContext context) {
      return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 4,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 8,
                      ),
                      child: Text(title, style: const TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6,
                      ),
                      Text('$duration min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(complexityText!),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(affordabilityText!),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }
  }


