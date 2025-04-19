import 'package:flutter/material.dart';
import 'package:tech_taste/data/categories_data.dart';
import 'package:tech_taste/data/restaurants_data.dart';
import 'package:tech_taste/model/restaurant.dart';
import 'package:tech_taste/ui/_core/widgets/app_bar.dart';
import 'package:tech_taste/ui/home/widgets/category_widget.dart';
import 'package:tech_taste/ui/home/widgets/menu_widget.dart';
import 'package:tech_taste/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';
import 'package:tech_taste/ui/_core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String categoriaSelecionada = '';
  String _searchQuery = '';
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    RestaurantsData restaurantsData = Provider.of<RestaurantsData>(context);

    final List<Restaurant> filteredRestaurants =
        restaurantsData.listRestaurants
            .where(
              (item) =>
                  (_searchQuery.isNotEmpty
                      ? (item.name.toLowerCase().contains(
                            _searchQuery.toLowerCase(),
                          ) ||
                          item.dishes.any(
                            (dish) => dish.name.toLowerCase().contains(
                              _searchQuery.toLowerCase(),
                            ),
                          ))
                      : (categoriaSelecionada.isNotEmpty
                          ? item.categories.contains(categoriaSelecionada)
                          : true)),
            )
            .toList();

    return Scaffold(
      drawer: Drawer(child: MenuWidget()),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32.0,
            children: [
              Center(child: Image.asset('assets/logo.png', width: 147)),
              Text(
                'Boas-vindas!',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                focusNode: FocusNode(canRequestFocus: true),
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'O que você quer comer?',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon:
                      _searchQuery.isNotEmpty
                          ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _controller.clear();
                              setState(() {
                                _searchQuery = '';
                              });
                            },
                          )
                          : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: AppColors.mainColor,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 12.0,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              Text(
                'Escolha por categoria',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8.0,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      final String categoria =
                          CategoriesData.listCategories[index];
                      final selecionado = categoria == categoriaSelecionada;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (categoriaSelecionada == categoria) {
                              categoriaSelecionada = '';
                            } else {
                              categoriaSelecionada = categoria;
                            }
                          });
                        },
                        child: CategoryWidget(
                          category: CategoriesData.listCategories[index],
                          selecionado: selecionado,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Image.asset('assets/banners/banner_promo.png'),
              Text('Bem avaliados'),
              Column(
                spacing: 16.0,
                children:
                    filteredRestaurants.isNotEmpty
                        ? List.generate(filteredRestaurants.length, (index) {
                          Restaurant restaurant = filteredRestaurants[index];
                          return RestaurantWidget(restaurant: restaurant);
                        })
                        : [
                          const Center(
                            child: Text('Nenhum restaurante encontrado!'),
                          ),
                        ],
              ),
              SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
