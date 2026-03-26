import 'package:flutter/material.dart';
import 'package:splitty/screens/goals/widgets/goal_progress_line.dart';
import 'package:splitty/utils/colors.dart';
import 'package:splitty/utils/format_currency.dart';

class GoalAmountSummaryCard extends StatelessWidget {
  final String title;
  final double? plannedAmount;
  final double? depositedAmount;
  final double progressHeight;
  final bool showDepositText;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;

  const GoalAmountSummaryCard({
    super.key,
    this.title = 'Meta Planejada',
    this.plannedAmount,
    this.depositedAmount,
    this.progressHeight = 12,
    this.showDepositText = true,
    this.padding = const EdgeInsets.all(16),
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final hasPlan = plannedAmount != null;
    final hasDeposit = depositedAmount != null;
    final shouldShowDeposit = showDepositText && hasPlan && hasDeposit;

    final plannedValue = hasPlan ? formatCurrency(plannedAmount!) : '--';

    final progressPercent = hasPlan && hasDeposit && plannedAmount! > 0
        ? (depositedAmount! / plannedAmount!) * 100
        : 0.0;

    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          Text(
            plannedValue,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          GoalProgressLine(
            progressPercent: progressPercent,
            height: progressHeight,
          ),
          if (shouldShowDeposit)
            Text(
              'Depositado: ${formatCurrency(depositedAmount!)} '
              'de ${formatCurrency(plannedAmount!)}',
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}
