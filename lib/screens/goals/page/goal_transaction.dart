import 'package:flutter/material.dart';
import 'package:splitty/screens/auth/widgets/custom_button.dart';
import 'package:splitty/screens/common/layouts/non_tab_screen_layout.dart';
import 'package:splitty/screens/goals/widgets/goal_transaction_header.dart';
import 'package:splitty/screens/goals/widgets/goal_transaction_help_card.dart';
import 'package:splitty/screens/goals/widgets/goal_transaction_type_switch.dart';
import 'package:splitty/utils/colors.dart';

class GoalTransaction extends StatefulWidget {
  const GoalTransaction({super.key});

  @override
  State<GoalTransaction> createState() => _GoalTransactionState();
}

class _GoalTransactionState extends State<GoalTransaction> {
  String _selectedType = 'deposito';

  @override
  Widget build(BuildContext context) {
    return NonTabScreenLayout(
      fallbackRoute: '/goals',
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const GoalTransactionHeader(
            title: 'Registrar Movimentação',
            subtitle: 'Caixinha Lisboa 2026',
          ),
          const SizedBox(height: 12),
          const GoalTransactionHelpCard(),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Valor', style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '0,00',
                    border: OutlineInputBorder(),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GoalTransactionTypeSwitch(
            selected: _selectedType,
            onChanged: (value) => setState(() => _selectedType = value),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primarySoft,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Sua movimentacao',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 6),
                Text(
                  'Voce esta registrando R\$ 0,00 nesta caixinha.',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Registrar minha movimentação',
            onPressed: () {},
            backgroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(vertical: 14),
            fontSize: 14,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
