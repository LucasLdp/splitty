import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitty/routes.dart';
import 'package:splitty/utils/colors.dart';

class SplittyApp extends StatelessWidget {
  const SplittyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: GoogleFonts.inter().fontFamily,
      ),
      routerConfig: RouteConfig.routes,
    );
  }
}
