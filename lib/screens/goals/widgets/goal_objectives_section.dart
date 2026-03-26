import 'package:flutter/material.dart';
import 'package:splitty/screens/goals/widgets/goal_mode_switch.dart';
import 'package:splitty/utils/colors.dart';
import 'package:splitty/utils/format_currency.dart';

class GoalObjective {
  final String name;
  final double amount;

  const GoalObjective({required this.name, required this.amount});
}

class GoalObjectivesSection extends StatelessWidget {
  final GoalMode mode;
  final List<GoalObjective> objectives;
  final TextEditingController singleAmountController;
  final TextEditingController objectiveNameController;
  final TextEditingController objectiveAmountController;
  final ValueChanged<GoalMode> onModeChanged;
  final VoidCallback onObjectiveAdd;
  final ValueChanged<int> onObjectiveRemove;
  final VoidCallback onSingleAmountChanged;

  const GoalObjectivesSection({
    super.key,
    required this.mode,
    required this.objectives,
    required this.singleAmountController,
    required this.objectiveNameController,
    required this.objectiveAmountController,
    required this.onModeChanged,
    required this.onObjectiveAdd,
    required this.onObjectiveRemove,
    required this.onSingleAmountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Objetivos e custos',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GoalModeSwitch(mode: mode, onChanged: onModeChanged),
              const SizedBox(height: 12),
              if (mode == GoalMode.single)
                _SingleAmountForm(
                  controller: singleAmountController,
                  onChanged: onSingleAmountChanged,
                )
              else
                _ObjectivesForm(
                  objectives: objectives,
                  nameController: objectiveNameController,
                  amountController: objectiveAmountController,
                  onAdd: onObjectiveAdd,
                  onRemove: onObjectiveRemove,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SingleAmountForm extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onChanged;

  const _SingleAmountForm({required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Valor total da caixinha',
            hintText: '0,00',
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          onChanged: (_) => onChanged(),
        ),
        const SizedBox(height: 8),
        const Text(
          'Use quando a caixinha tiver apenas um valor unico.',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class _ObjectivesForm extends StatelessWidget {
  final List<GoalObjective> objectives;
  final TextEditingController nameController;
  final TextEditingController amountController;
  final VoidCallback onAdd;
  final ValueChanged<int> onRemove;

  const _ObjectivesForm({
    required this.objectives,
    required this.nameController,
    required this.amountController,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final indicatorColors = [
      const Color(0xFFE57373),
      const Color(0xFF9575CD),
      const Color(0xFF64B5F6),
      const Color(0xFF81C784),
      const Color(0xFFFFB74D),
    ];

    return Column(
      children: [
        if (objectives.isEmpty)
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text(
              'Adicione custos separados por objetivo.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        for (int i = 0; i < objectives.length; i++)
          _ObjectiveRow(
            objective: objectives[i],
            color: indicatorColors[i % indicatorColors.length],
            onRemove: () => onRemove(i),
          ),
        const Divider(height: 24),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: 'Objetivo',
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Custo',
            hintText: '0,00',
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: onAdd,
            style: TextButton.styleFrom(
              backgroundColor: AppColors.primarySoft,
              foregroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('Adicionar custo/meta'),
          ),
        ),
      ],
    );
  }
}

class _ObjectiveRow extends StatelessWidget {
  final GoalObjective objective;
  final Color color;
  final VoidCallback onRemove;

  const _ObjectiveRow({
    required this.objective,
    required this.color,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              objective.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            formatCurrency(objective.amount),
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close, size: 18),
            color: Colors.redAccent,
            tooltip: 'Remover',
          ),
        ],
      ),
    );
  }
}
