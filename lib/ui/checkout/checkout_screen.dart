import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/model/dish.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';
import 'package:tech_taste/ui/_core/bag_provider.dart';
import 'package:tech_taste/ui/checkout/widgets/address_widget.dart';
import 'package:tech_taste/ui/checkout/widgets/confirmation_widget.dart';
import 'package:tech_taste/ui/checkout/widgets/dish_item_widget.dart';
import 'package:tech_taste/ui/checkout/widgets/payment_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    int qtd = bagProvider.getMapByAmount().length;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sacola'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(),
        actions: [
          TextButton(
            onPressed: () => bagProvider.clearBag(),
            child: const Text(
              'Limpar',
              style: TextStyle(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
      body:
          qtd > 0
              ? SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pedido',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Column(
                      children: List.generate(
                        bagProvider.getMapByAmount().keys.length,
                        (index) {
                          Dish dish =
                              bagProvider.getMapByAmount().keys.toList()[index];
                          int ammount =
                              bagProvider
                                  .getMapByAmount()
                                  .values
                                  .toList()[index];
                          return DishItem(dish: dish, amount: ammount);
                        },
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'Pagamento',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const PaymentCard(),
                    const SizedBox(height: 24.0),
                    Text(
                      'Entregar no endereço',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const AddressCard(),
                    const SizedBox(height: 24.0),
                    Text(
                      'Confirmar',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    const ConfirmationBox(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              )
              : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/others/empty_bag.png',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Sua sacola está vazia!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
    );
  }
}
