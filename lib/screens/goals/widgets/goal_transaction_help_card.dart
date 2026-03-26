import 'package:flutter/material.dart';
import 'package:splitty/utils/colors.dart';

class GoalTransactionHelpCard extends StatelessWidget {
  const GoalTransactionHelpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Como usar', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Deposito: quando voce adiciona dinheiro na caixinha.\n'
            'Retirada: quando voce registra uma saida do valor guardado.',
          ),
        ],
      ),
    );
  }
}
