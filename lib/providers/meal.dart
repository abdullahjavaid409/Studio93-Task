import 'package:flutter/foundation.dart';
import 'package:task/models/meal.dart';

class MealProvider extends ChangeNotifier {
  final List<Meal> _meals = Meal.dummyMeals;

  List<Meal> get meals => _meals;

  void addMeal(Meal meal) {
    _meals.add(meal);
    notifyListeners();
  }

  void deleteMeal(int index) {
    if (index >= 0 && index < _meals.length) {
      _meals.removeAt(index);
      notifyListeners();
    }
  }
}
