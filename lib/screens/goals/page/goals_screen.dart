import 'package:flutter/material.dart';
import 'package:splitty/screens/goals/sections/goals_header.dart';
import 'package:splitty/screens/goals/sections/goals_saving_goals_list.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GoalsHeader(),
        Expanded(child: GoalsSavingGoalsList()),
      ],
    );
  }
}
