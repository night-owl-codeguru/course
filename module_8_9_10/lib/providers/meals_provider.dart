import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:module_8_9_10/models/meal.dart';
import 'package:module_8_9_10/data/dummy_data.dart';
import 'package:module_8_9_10/providers/filters_provider.dart';

final mealsProvider = Provider<List<Meal>>((ref) {
  return dummyMeals;
});

final filteredMealsProvider = Provider<List<Meal>>((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
