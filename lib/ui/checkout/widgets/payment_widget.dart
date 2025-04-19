import 'package:flutter/material.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset('assets/others/visa.png', width: 36),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'VISA Classic\n****-0976',
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            width: 32.0,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 18.0),
              color: Colors.black,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
