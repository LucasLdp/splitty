import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splitty/routes.dart';
import 'package:splitty/utils/colors.dart';

class SplittyApp extends StatelessWidget {
  const SplittyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      canvasColor: AppColors.background,
      fontFamily: GoogleFonts.inter().fontFamily,
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: baseTheme.copyWith(
        colorScheme: baseTheme.colorScheme.copyWith(
          surface: AppColors.background,
        ),
      ),
      builder: (context, child) {
        return ColoredBox(
          color: AppColors.background,
          child: child ?? const SizedBox.shrink(),
        );
      },
      routerConfig: RouteConfig.routes,
    );
  }
}
