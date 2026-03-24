import 'package:flutter/material.dart';
import 'package:splitty/screens/groups/sections/groups_header.dart';
import 'package:splitty/screens/groups/sections/groups_saving_goals_list.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        GroupsHeader(),
        Expanded(child: GroupsSavingGoalsList()),
      ],
    );
  }
}
