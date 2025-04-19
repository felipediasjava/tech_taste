import 'package:flutter/material.dart';
import 'package:tech_taste/model/user.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';
import 'package:tech_taste/ui/account/account_screen.dart';
import 'package:tech_taste/ui/checkout/checkout_screen.dart';

enum Pages { checkout, account }

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  Pages? selectedPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0.0, 4.0),
              child: Text(
                'Menu',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                selected: selectedPage == Pages.checkout,
                selectedTileColor: AppColors.primaryColor,
                title: Text(
                  'Sacola',
                  style:
                      (selectedPage == Pages.checkout
                          ? TextStyle(
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.w700,
                          )
                          : TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          )),
                ),
                onTap: () {
                  setState(() {
                    selectedPage = Pages.checkout;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckoutScreen(),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                selected: selectedPage == Pages.account,
                selectedTileColor: AppColors.primaryColor,
                title: Text(
                  'Minha conta',
                  style:
                      (selectedPage == Pages.account
                          ? TextStyle(
                            color: AppColors.backgroundColor,
                            fontWeight: FontWeight.w700,
                          )
                          : TextStyle(
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w700,
                          )),
                ),
                onTap: () {
                  setState(() {
                    selectedPage = Pages.account;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => AccountScreen(
                            user: User(
                              name: 'Teste',
                              email: 'teste@email.com',
                              profileImageUrl: '',
                            ),
                          ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
