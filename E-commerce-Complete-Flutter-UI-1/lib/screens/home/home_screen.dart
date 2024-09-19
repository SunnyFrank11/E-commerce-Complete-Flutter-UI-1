import 'package:flutter/material.dart';
import 'package:shop_app/screens/home/components/categories.dart';

import 'components/best_selling_products.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
import 'components/special_offers.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              HomeHeader(),
              UserAccountBanner(),
              Categories(),
              SizedBox(height: 10),
              HotDealsProducts(),
              SizedBox(height: 10),
              RecommendedProducts(),
              SizedBox(height: 20),
              BestSellingProducts(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
