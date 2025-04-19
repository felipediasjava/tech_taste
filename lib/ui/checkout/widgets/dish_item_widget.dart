import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/model/dish.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';
import 'package:tech_taste/ui/_core/bag_provider.dart';

class DishItem extends StatefulWidget {
  final Dish dish;
  final int amount;

  const DishItem({super.key, required this.dish, required this.amount});

  @override
  State<DishItem> createState() => DishItemWidgetState();
}

class DishItemWidgetState extends State<DishItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void increment() {
      setState(() {
        context.read<BagProvider>().updateAmountMapByDish(
          ActionInBag.increment,
          widget.dish,
        );
      });
    }

    void decrement() {
      setState(() {
        context.read<BagProvider>().updateAmountMapByDish(
          ActionInBag.decrement,
          widget.dish,
        );
      });
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              'assets/dishes/default.png',
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dish.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'R\$ ${widget.dish.price.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.delete, size: 32.0),
                    color: Colors.red,
                    onPressed:
                        () => context.read<BagProvider>().removeAllDishes(
                          widget.dish,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 16,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_drop_up, size: 32.0),
                    color: Colors.black,
                    onPressed: () => increment(),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.amount.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                const SizedBox(height: 4),
                CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  radius: 16,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.arrow_drop_down, size: 32.0),
                    color: Colors.black,
                    onPressed: () => decrement(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
