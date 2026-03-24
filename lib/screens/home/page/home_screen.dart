import 'package:flutter/material.dart';
import 'package:splitty/screens/home/sections/home_header.dart';
import 'package:splitty/screens/home/sections/home_recent_transactions.dart';
import 'package:splitty/screens/home/sections/home_saving_goals.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: const [
          HomeHeader(),
          HomeSavingGoals(),
          HomeRecentTransactions(),
        ],
      ),
    );
  }
}
