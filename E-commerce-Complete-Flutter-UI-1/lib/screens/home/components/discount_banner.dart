import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

class UserAccountBanner extends StatefulWidget {
  const UserAccountBanner({
    Key? key,
  }) : super(key: key);

  @override
  State<UserAccountBanner> createState() => _UserAccountBannerState();
}

bool showBalance = false;

String formatCurrency(double amount,
    {String locale = 'en_NG', String symbol = '₦'}) {
  final NumberFormat currencyFormat = NumberFormat.simpleCurrency(
    locale: locale,
    name: symbol,
  );
  return currencyFormat.format(amount);
}

void walletActions(context) {
  showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 300,
          width: double.infinity,
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                WalletActionButton(
                  actionIcon: Iconsax.chart_2_outline,
                  actionTap: () {},
                  actionTitle: 'Monitor spending',
                ),
                WalletActionButton(
                  actionIcon: Iconsax.coin_1_outline,
                  actionTap: () {},
                  actionTitle: 'Withdraw funds',
                ),
                WalletActionButton(
                  actionIcon: Iconsax.money_add_outline,
                  actionTap: () {},
                  actionTitle: 'Fund wallet',
                ),
                WalletActionButton(
                  actionIcon: Iconsax.money_3_outline,
                  actionTap: () {},
                  actionTitle: 'Cash backs',
                ),
              ],
            ),
          ),
        );
      });
}

class _UserAccountBannerState extends State<UserAccountBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 8,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            const Color(0xFF144216),
            Colors.green.shade700,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          transform: GradientRotation(0.02),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Wallet balance:',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            textBaseline: TextBaseline.ideographic,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: [
              RichText(
                  text: TextSpan(
                text: showBalance
                    ? "${formatCurrency(54044.45.toDouble())}"
                    : '*****',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showBalance = !showBalance;
                  });
                },
                child: Icon(
                  showBalance ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  print('open wallet for funding');
                  walletActions(context);
                },
                child: Icon(
                  Iconsax.wallet_3_outline,
                  size: 34,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class WalletActionButton extends StatelessWidget {
  const WalletActionButton({
    super.key,
    required this.actionTitle,
    required this.actionIcon,
    required this.actionTap,
  });

  final String actionTitle;
  final IconData actionIcon;
  final VoidCallback actionTap;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        onTap: actionTap,
        leading: Icon(actionIcon),
        title: Text(actionTitle),
      ),
    );
  }
}
