import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tech_taste/model/restaurant.dart';

class RestaurantsData extends ChangeNotifier {
  List<Restaurant> listRestaurants = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurants = data['restaurants'];
    for (var restaurant in restaurants) {
      listRestaurants.add(Restaurant.fromMap(restaurant));
    }
  }
}
