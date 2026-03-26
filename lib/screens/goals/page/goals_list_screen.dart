import 'package:flutter/material.dart';
import 'package:splitty/screens/goals/sections/goal_list/goals_list_header.dart';
import 'package:splitty/screens/goals/sections/goal_list/goals_list.dart';

class GoalsListScreen extends StatelessWidget {
  const GoalsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GoalsListHeader(),
        Expanded(child: GoalsList()),
      ],
    );
  }
}
