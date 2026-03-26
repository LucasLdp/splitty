import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitty/screens/auth/widgets/custom_button.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';
import 'package:splitty/screens/goals/widgets/goal_amount_summary_card.dart';
import 'package:splitty/screens/goals/widgets/goal_partcipants_avatar.dart';
import 'package:splitty/utils/colors.dart';
import 'package:splitty/utils/format_currency.dart';

class GoalsDetailHeader extends StatelessWidget {
  final String title;
  final String goalId;

  const GoalsDetailHeader({
    super.key,
    required this.title,
    required this.goalId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: title),
        Text(
          "5 Participantes - Admin: Mário",
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        GoalPartcipantsAvatar(
          participants: ["Pedro", "Mateus", "Alice", "João", "Maria"],
          radius: 12,
          overlap: 8,
        ),
        GoalAmountSummaryCard(plannedAmount: 1000.00, depositedAmount: 120.00),
        Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Arrecadado",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatCurrency(5000),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sua Contribuição",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      formatCurrency(2500),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: 'Adicionar movimentação',
            icon: Icons.add_circle_outline,
            onPressed: () {
              context.go('/goals/$goalId/transaction');
            },
            padding: const EdgeInsets.symmetric(vertical: 14),
            fontSize: 14,
            backgroundColor: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
