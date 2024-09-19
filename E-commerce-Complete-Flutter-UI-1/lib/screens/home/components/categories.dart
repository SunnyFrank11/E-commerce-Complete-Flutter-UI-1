import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/screens/home/components/special_offers.dart';
import 'package:shop_app/screens/products/products_screen.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"text": 'Create Store', "icon": Iconsax.add_circle_outline},
      {"text": 'Popular Stores', "icon": Iconsax.shop_outline},
      {"text": 'Recent purchase', "icon": Iconsax.shopping_bag_outline},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: const Color.fromARGB(148, 199, 241, 199),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.green.shade800,
            ),
          )
        ],
      ),
    );
  }
}

class HotDealsProducts extends StatelessWidget {
  const HotDealsProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectionTitle(
            titleIcon: Iconsax.flash_1_bold,
            iconColor: Colors.red,
            title: "Hot deals",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              HotDealCard(
                image: "assets/images/feet_in_shoes.jpg",
                category: "Shoes",
                // numOfBrands: 18,
                newPrice: 15000,
                oldPrice: 18000,
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
              HotDealCard(
                image: "assets/images/homekit.jpg",
                category: "Jersey",
                // numOfBrands: 24,
                newPrice: 12800,
                oldPrice: 17000,
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
              HotDealCard(
                image: "assets/images/phone.jpg",
                category: "Smartphone",
                // numOfBrands: 18,
                newPrice: 134000,
                oldPrice: 150000,
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
              HotDealCard(
                image: "assets/images/smartwatch.jpg",
                category: "Smartwatch",
                // numOfBrands: 18,
                newPrice: 25900,
                oldPrice: 37800,
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
