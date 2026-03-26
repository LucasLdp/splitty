import 'package:flutter/material.dart';
import 'package:splitty/screens/home/widgets/saving_goal_preview.dart';

class HomeSavingGoals extends StatelessWidget {
  const HomeSavingGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          "Metas Recentes",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Column(
          spacing: 12,
          children: [
            SavingGoalPreview(name: "Viagem para a praia", color: Colors.blue),
            SavingGoalPreview(
              name: "Festa de aniversário",
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
