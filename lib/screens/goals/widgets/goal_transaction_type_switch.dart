import 'package:flutter/material.dart';
import 'package:splitty/utils/colors.dart';

class GoalTransactionTypeSwitch extends StatelessWidget {
  final String selected;
  final ValueChanged<String> onChanged;

  const GoalTransactionTypeSwitch({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tipo de movimentação',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.primarySoft,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              _SwitchItem(
                label: 'Deposito',
                isSelected: selected == 'deposito',
                onTap: () => onChanged('deposito'),
              ),
              _SwitchItem(
                label: 'Retirada',
                isSelected: selected == 'retirada',
                onTap: () => onChanged('retirada'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SwitchItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _SwitchItem({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
