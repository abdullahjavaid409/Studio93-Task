import 'package:flutter/foundation.dart';
import 'package:task/models/meal.dart';

class MealProvider extends ChangeNotifier {
  final List<Meal> _meals = Meal.dummyMeals;

  List<Meal> get meals => _meals;
  void notify() {
    notifyListeners();
  }

  void addMeal(Meal meal, MealProduct product) {
    meal.mealProduct.add(product);
    notifyListeners();
  }

  void deleteMeal(Meal meal, MealProduct product) {
    meal.mealProduct.remove(product);
    notifyListeners();
  }
}
