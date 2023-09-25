import 'package:flutter/material.dart';

class Meal {
  final IconData productIcon;
  final String productTitle;
  bool isEdit;
  final List<MealProduct> mealProduct;

  Meal(
      {required this.productIcon,
      required this.productTitle,
      this.isEdit = false,
      this.mealProduct = const []});

  static List<Meal> dummyMeals = [
    Meal(
      productIcon: Icons.fastfood,
      productTitle: "Burger Combo",
      mealProduct: [
        MealProduct(productItemName: "Classic Burger", price: 6.99),
        MealProduct(productItemName: "French Fries", price: 2.99),
        MealProduct(productItemName: "Soda", price: 1.99),
      ],
    ),
    Meal(
      productIcon: Icons.local_pizza,
      productTitle: "Pizza Party",
      mealProduct: [
        MealProduct(productItemName: "Pepperoni Pizza", price: 9.99),
        MealProduct(productItemName: "Garlic Breadsticks", price: 3.99),
        MealProduct(productItemName: "Soft Drink", price: 1.99),
      ],
    ),
    Meal(
      productIcon: Icons.local_dining,
      productTitle: "Pasta Delight",
      mealProduct: [
        MealProduct(productItemName: "Spaghetti Carbonara", price: 8.99),
        MealProduct(productItemName: "Caesar Salad", price: 4.99),
        MealProduct(productItemName: "Iced Tea", price: 1.49),
      ],
    ),
  ];
}

class MealProduct {
  final String productItemName;
  final double price;

  MealProduct({required this.productItemName, required this.price});
}
