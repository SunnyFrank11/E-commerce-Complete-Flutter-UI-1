import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          const SizedBox(width: 8),
          Badge.count(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            count: 12,
            child: Icon(
              Iconsax.notification_outline,
              color: const Color(0xFF144216),
            ),
          )
        ],
      ),
    );
  }
}
