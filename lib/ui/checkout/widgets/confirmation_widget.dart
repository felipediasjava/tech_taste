import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';
import 'package:tech_taste/ui/_core/bag_provider.dart';

class ConfirmationBox extends StatelessWidget {
  const ConfirmationBox({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Pedido:', style: TextStyle(color: Colors.white70)),
              Text(
                'R\$ ${bagProvider.getTotalAmount()}',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Entrega:', style: TextStyle(color: Colors.white70)),
              Text(
                'R\$ ${bagProvider.getDeliveryTax()}',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
          const Divider(height: 24, color: Colors.white30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'R\$ ${bagProvider.getTotalAmount() + bagProvider.getDeliveryTax()}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Pedido efetuado com sucesso!'),
                    duration: Duration(seconds: 5),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 80.0,
                  vertical: 16.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              icon: const Icon(
                Icons.account_balance_wallet_outlined,
                color: Colors.black,
              ),
              label: const Text('Pedir', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
