enum Complexity{
  simple,
  challenging,
  hard,
}
enum Affordability{
  affordable,
  pricey,
  luxorious
}
class Meal{
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegeterian;
  Meal({
    required this.id,
    required this.title,
    required this.ingredients,
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.categories,
    required this.steps,
    required this.imageUrl,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegeterian,
});
}