import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/screens/products/products_screen.dart';

import 'section_title.dart';

class RecommendedProducts extends StatelessWidget {
  const RecommendedProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SectionTitle(
            iconColor: Colors.yellow,
            titleIcon: Iconsax.star_bold,
            title: "Recommended",
            press: () {},
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: "assets/images/Image Banner 2.png",
                category: "Smartphone",
                numOfBrands: 18,
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
              SpecialOfferCard(
                image: "assets/images/Image Banner 3.png",
                category: "Fashion",
                numOfBrands: 24,
                press: () {
                  Navigator.pushNamed(context, ProductsScreen.routeName);
                },
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Brands")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HotDealCard extends StatelessWidget {
  const HotDealCard({
    Key? key,
    required this.category,
    required this.image,
    required this.press,
    required this.newPrice,
    required this.oldPrice,
  }) : super(key: key);

  final String category, image;

  final GestureTapCallback press;
  final int newPrice;
  final int oldPrice;

  @override
  Widget build(BuildContext context) {
    double percentageDiscount(int oldPrice, int newPrice) {
      final percentageDiscount = ((oldPrice - newPrice) / oldPrice) * 100;
      return percentageDiscount;
    }

    String formatCurrency(double amount,
        {String locale = 'en_NG', String symbol = '₦'}) {
      final NumberFormat currencyFormat = NumberFormat.simpleCurrency(
        locale: locale,
        name: symbol,
      );
      return currencyFormat.format(amount);
    }

    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 200,
          height: 180,
          child: GridTile(
            footer: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              height: 60,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${formatCurrency(oldPrice.toDouble())}",
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.white,
                            decorationThickness: 2,
                          ),
                        ),
                        TextSpan(
                          text:
                              ' - ${percentageDiscount(oldPrice, newPrice).toStringAsFixed(1)}%',
                          style: TextStyle(
                            color: Colors.amber,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                      text: TextSpan(
                    text: "${formatCurrency(newPrice.toDouble())}",
                    style: TextStyle(fontSize: 18, color: Colors.green),
                  )),
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.7),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18))),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
