import 'package:flutter/material.dart';
import 'package:tech_taste/model/dish.dart';

enum ActionInBag { increment, decrement }

class BagProvider extends ChangeNotifier {
  int deliveryTax = 6;

  List<Dish> dishesOnBag = [];

  void addAllDishes(List<Dish> dishes) {
    dishesOnBag.addAll(dishes);
    notifyListeners();
  }

  void removeDish(Dish dish) {
    dishesOnBag.remove(dish);
    notifyListeners();
  }

  void removeAllDishes(Dish dish) {
    dishesOnBag.removeWhere((item) => item == dish);
    notifyListeners();
  }

  void clearBag() {
    dishesOnBag.clear();
    notifyListeners();
  }

  int getDeliveryTax() => deliveryTax;

  int getTotalAmount() {
    int totalAmount = 0;
    for (Dish dish in dishesOnBag) {
      totalAmount += dish.price;
    }
    return totalAmount;
  }

  Map<Dish, int> getMapByAmount() {
    Map<Dish, int> mapResult = {};
    for (Dish dish in dishesOnBag) {
      if (mapResult[dish] == null) {
        mapResult[dish] = 1;
      } else {
        mapResult[dish] = mapResult[dish]! + 1;
      }
    }
    return mapResult;
  }

  void updateAmountMapByDish(ActionInBag action, Dish dish) {
    Map<Dish, int> mapResult = {};
    int qtd = dishesOnBag.where((item) => item == dish).length;
    if (action == ActionInBag.increment) {
      dishesOnBag.add(dish);
      mapResult[dish] = dishesOnBag.where((item) => item == dish).length;
      notifyListeners();
    }
    if (action == ActionInBag.decrement) {
      if (qtd > 1) {
        dishesOnBag.remove(dish);
        mapResult[dish] = dishesOnBag.where((item) => item == dish).length;
        notifyListeners();
      }
    }
  }

  /*
    provider -> componentes que estiverem ouvindo o BagProvider serão
    atualizados, ou seja, vai atualizar a interface quando houve mudanças
    notifyListeners();
  */
}
