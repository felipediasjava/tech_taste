import 'package:flutter/material.dart';
import 'package:tech_taste/data/restaurants_data.dart';
import 'package:tech_taste/ui/_core/app_theme.dart';
import 'package:tech_taste/ui/_core/bag_provider.dart';
import 'package:tech_taste/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  // Garante que as coisas que são assíncronas serão executadas antes da aplicação.
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantsData restaurantsData = RestaurantsData();
  await restaurantsData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantsData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: SplashScreen(),
    );
  }
}
