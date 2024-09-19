import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants.dart';
import '../models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRetio;
  final Product product;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    String formatCurrency(double amount,
        {String locale = 'en_NG', String symbol = '₦'}) {
      final NumberFormat currencyFormat = NumberFormat.simpleCurrency(
        locale: locale,
        name: symbol,
      );
      return currencyFormat.format(amount);
    }

    return SizedBox(
      width: width,
      child: GestureDetector(
        onTap: onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.02,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(product.images[0]),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product.title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                  text: formatCurrency(product.price),
                  style: TextStyle(
                    color: Colors.green,
                  ),
                )),
                // InkWell(
                //   borderRadius: BorderRadius.circular(50),
                //   onTap: () {},
                //   child: Container(
                //     padding: const EdgeInsets.all(6),
                //     height: 24,
                //     width: 24,
                //     decoration: BoxDecoration(
                //       color: product.isFavourite
                //           ? Colors.green.withOpacity(0.4)
                //           : kSecondaryColor.withOpacity(0.1),
                //       shape: BoxShape.circle,
                //     ),
                //     child: SvgPicture.asset(
                //       "assets/icons/Heart Icon_2.svg",
                //       colorFilter: ColorFilter.mode(
                //           product.isFavourite
                //               ? Colors.green
                //               : const Color(0xFFDBDEE4),
                //           BlendMode.srcIn),
                //     ),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
  // Text(
  //                 formatCurrency(product.price),
  //                 style: const TextStyle(
  //                   fontSize: 14,
  //                   fontWeight: FontWeight.w600,
  //                   color: kPrimaryColor,
  //                 ),
  //               ),