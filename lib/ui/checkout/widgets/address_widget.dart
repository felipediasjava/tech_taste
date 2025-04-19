import 'package:flutter/material.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key});

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
          const Icon(Icons.location_on, color: Colors.white70),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Rua dos Alfeneiros nº 4\nBloco J, Casa 10',
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
