import 'package:flutter/material.dart';

class GoalBasicForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController periodController;

  const GoalBasicForm({
    super.key,
    required this.nameController,
    required this.periodController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nome da caixinha',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Ex: Viagem em familia',
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Periodo da meta',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: periodController,
          decoration: const InputDecoration(
            hintText: 'Mai/2026 ate Out/2026',
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}
