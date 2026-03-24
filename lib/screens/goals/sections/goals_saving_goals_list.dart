import 'package:flutter/material.dart';
import 'package:splitty/screens/goals/widgets/saving_goal_item.dart';

class GoalsSavingGoalsList extends StatelessWidget {
  const GoalsSavingGoalsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.generate(10, (index) {
        return SavingGoalItem(
          goalName: "Viagem para a praia",
          participants: ["Alice", "Bob", "Charlie"],
        );
      }),
    );
  }
}
