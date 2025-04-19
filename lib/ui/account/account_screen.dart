import 'package:flutter/material.dart';
import 'package:tech_taste/model/user.dart';

class AccountScreen extends StatelessWidget {
  final User user;

  const AccountScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Minha conta')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.transparent,
                backgroundImage:
                    (user.profileImageUrl.isNotEmpty
                        ? NetworkImage(user.profileImageUrl)
                        : Image.asset('assets/others/user_profile.png').image),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Nome:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(user.name, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text(
              'Email:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(user.email, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
