import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitty/screens/auth/widgets/custom_button.dart';
import 'package:splitty/screens/common/layouts/non_tab_screen_layout.dart';
import 'package:splitty/screens/goals/sections/goal_detail/goal_partipants_list.dart';
import 'package:splitty/screens/goals/sections/goal_detail/goal_transactions_list.dart';
import 'package:splitty/screens/goals/sections/goal_detail/goals_detail_header.dart';
import 'package:splitty/screens/goals/widgets/participants_contribution_list_sheet.dart';
import 'package:splitty/screens/home/widgets/transactions_list_sheet.dart';
import 'package:splitty/utils/colors.dart';

class GoalDetailScreen extends StatelessWidget {
  final String title;
  final String goalId;

  const GoalDetailScreen({
    super.key,
    required this.title,
    required this.goalId,
  });

  @override
  Widget build(BuildContext context) {
    final participants = [
      const ParticipantContribution(name: 'Você', amount: 92.10),
      const ParticipantContribution(name: 'Alex', amount: -34.20),
      const ParticipantContribution(name: 'Mário', amount: 65.00),
      const ParticipantContribution(name: 'João', amount: -12.75),
      const ParticipantContribution(name: 'Alice', amount: 28.40),
      const ParticipantContribution(name: 'Mateus', amount: -5.00),
    ];

    final transactions = [
      const TransactionItem(
        title: 'Alex colaborou',
        subtitle: 'Contribuicao adicionada',
        amount: 64.00,
      ),
      const TransactionItem(
        title: 'Voce colaborou',
        subtitle: 'Contribuicao adicionada',
        amount: 28.00,
      ),
      const TransactionItem(
        title: 'Alice retirou',
        subtitle: 'Contribuicao ajustada',
        amount: -12.00,
      ),
    ];

    return NonTabScreenLayout(
      fallbackRoute: '/goals',
      child: ListView(
        children: [
          GoalsDetailHeader(title: title, goalId: goalId),
          const SizedBox(height: 24),
          GoalPartipantsList(participants: participants),
          const SizedBox(height: 24),
          GoalTransactionsList(transactions: transactions),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: Column(
              children: [
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Editar',
                    icon: Icons.edit,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    fontSize: 14,
                    backgroundColor: AppColors.primarySoft,
                    textColor: AppColors.primary,
                    iconColor: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: 'Remover',
                    icon: Icons.delete_outline,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    fontSize: 14,
                    backgroundColor: AppColors.primarySoft,
                    textColor: AppColors.primary,
                    iconColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
