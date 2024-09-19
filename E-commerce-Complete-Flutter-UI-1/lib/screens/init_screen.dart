import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:shop_app/screens/favorite/favorite_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';

const Color inActiveIconColor = Color(0xFFB6B6B6);

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static String routeName = "/";

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int currentSelectedIndex = 0;

  void updateCurrentIndex(int index) {
    setState(() {
      currentSelectedIndex = index;
    });
  }

  final pages = [
    const HomeScreen(),
    const FavoriteScreen(),
    CartPage(),
    const Center(
      child: Text("Chat"),
    ),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: updateCurrentIndex,
        currentIndex: currentSelectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF144216),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_1_bold),
            activeIcon: Icon(Iconsax.home_1_bold),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.heart_outline),
            activeIcon: Icon(Iconsax.heart_bold),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.shopping_cart_outline),
            activeIcon: Icon(Iconsax.shopping_cart_bold),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.message_outline),
            activeIcon: Icon(Iconsax.message_bold),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user_outline),
            activeIcon: Icon(Iconsax.user_bold),
            label: "Fav",
          ),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cart'),
    );
  }
}
