import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitty/screens/goals/widgets/saving_goal_item.dart';

class GoalsList extends StatelessWidget {
  const GoalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(10, (index) {
        const goalName = 'Viagem para a praia';

        return SavingGoalItem(
          onTap: () {
            context.pushNamed(
              'goal-detail',
              pathParameters: {'id': '${index + 1}'},
              extra: goalName,
            );
          },
          goalName: goalName,
          participants: ["Alice", "Bob", "Charlie"],
        );
      }),
    );
  }
}
