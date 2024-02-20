import 'dart:math';

import 'package:flutter/material.dart';
import 'package:women_day/mobile_view_screen.dart';

import 'widgets/responsive_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  int? queryNumber;
  String? aiResponse;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ResponsiveBuilder(
      mobileBuilder: (context, constraints) {
        return const MobileViewScreen();
      },
      desktopBuilder: (context, constraints) {
        return const SizedBox();
      },
      tabletBuilder: (context, constraints) {
        return const SizedBox();
      },
    );
  }
}
