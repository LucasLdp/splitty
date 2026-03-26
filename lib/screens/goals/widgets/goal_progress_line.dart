import 'package:flutter/material.dart';
import 'package:splitty/utils/colors.dart';

class GoalProgressLine extends StatelessWidget {
  final double progressPercent;
  final double height;
  final Color backgroundColor;

  const GoalProgressLine({
    super.key,
    required this.progressPercent,
    this.height = 8,
    this.backgroundColor = const Color(0xFFE6E6E6),
  });

  @override
  Widget build(BuildContext context) {
    final clamped = (progressPercent / 100).clamp(0, 1).toDouble();

    return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: clamped,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(height / 2),
          ),
        ),
      ),
    );
  }
}
