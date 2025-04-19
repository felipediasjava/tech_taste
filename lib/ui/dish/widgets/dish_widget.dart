import 'package:flutter/material.dart';
import 'package:tech_taste/model/dish.dart';
import 'package:tech_taste/model/restaurant.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';
import 'package:tech_taste/ui/dish/dish_screen.dart';

class DishCard extends StatefulWidget {
  final Restaurant restaurant;
  final List<Dish> dishes;

  const DishCard({required this.restaurant, required this.dishes, super.key});

  @override
  State<DishCard> createState() => _DishCardState();
}

class _DishCardState extends State<DishCard> {
  final int initialQtyDishes = 3;
  bool _showAll = false;

  @override
  Widget build(BuildContext context) {
    final List<Dish> displayedDishes =
        _showAll
            ? widget.dishes
            : widget.dishes.take(initialQtyDishes).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...displayedDishes.map(
          (dish) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) =>
                          DishScreen(restaurant: widget.restaurant, dish: dish),
                ),
              );
            },
            child: Material(
              child: Card(
                color: AppColors.backgroundCardsColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.only(bottom: 16.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                      child: Image.asset(
                        'assets/dishes/default.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dish.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                          const SizedBox(height: 12.0),
                          Text(
                            dish.description,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (widget.dishes.length > initialQtyDishes)
          TextButton(
            onPressed: () {
              setState(() {
                _showAll = !_showAll;
              });
            },
            child: Text(
              _showAll ? 'Ver menos pratos' : 'Ver mais pratos',
              style: const TextStyle(color: AppColors.primaryColor),
            ),
          ),
      ],
    );
  }
}
