import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/model/dish.dart';
import 'package:tech_taste/model/restaurant.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';
import 'package:tech_taste/ui/_core/bag_provider.dart';
import 'package:tech_taste/ui/_core/widgets/app_bar.dart';

class DishScreen extends StatefulWidget {
  final Restaurant restaurant;
  final Dish dish;

  const DishScreen({super.key, required this.restaurant, required this.dish});

  @override
  State<DishScreen> createState() => _DishWidgetState();
}

class _DishWidgetState extends State<DishScreen> {
  int _quantity = 1;

  @override
  void initState() {
    super.initState();
    _quantity = 1;
  }

  void _increment() {
    setState(() => _quantity++);
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: widget.restaurant.name),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 0.0,
                color: Theme.of(context).scaffoldBackgroundColor,
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
                            widget.dish.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          Text('R\$ ${widget.dish.price.toStringAsFixed(2)}'),
                          const SizedBox(height: 12.0),
                          Text(
                            widget.dish.description,
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_drop_down, size: 32.0),
                            color: Colors.black,
                            onPressed: _decrement,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '$_quantity',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.arrow_drop_up, size: 32.0),
                            color: Colors.black,
                            onPressed: _increment,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                        ),
                        onPressed: () {
                          final dishesToAdd = List.generate(
                            _quantity,
                            (_) => widget.dish,
                          );
                          context.read<BagProvider>().addAllDishes(dishesToAdd);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '$_quantity ${_quantity == 1 ? 'prato' : 'pratos'} adicionados à sacola!',
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text('Adicionar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
