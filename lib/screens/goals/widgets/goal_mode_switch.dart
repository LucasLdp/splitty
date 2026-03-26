import 'package:flutter/material.dart';
import 'package:splitty/utils/colors.dart';

enum GoalMode { single, objectives }

class GoalModeSwitch extends StatelessWidget {
  final GoalMode mode;
  final ValueChanged<GoalMode> onChanged;

  const GoalModeSwitch({
    super.key,
    required this.mode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          _GoalModeSwitchItem(
            label: 'Valor unico',
            isSelected: mode == GoalMode.single,
            onTap: () => onChanged(GoalMode.single),
          ),
          _GoalModeSwitchItem(
            label: 'Por objetivos',
            isSelected: mode == GoalMode.objectives,
            onTap: () => onChanged(GoalMode.objectives),
          ),
        ],
      ),
    );
  }
}

class _GoalModeSwitchItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _GoalModeSwitchItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final background = isSelected ? Colors.white : Colors.transparent;
    final textColor = isSelected ? AppColors.primary : Colors.white;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
          ),
        ),
      ),
    );
  }
}
