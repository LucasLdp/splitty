import 'package:flutter/material.dart';
import 'package:splitty/screens/home/widgets/transaction_info.dart';

class HomeRecentTransactions extends StatelessWidget {
  const HomeRecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Text(
          "Movimentações Recentes",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Column(
          spacing: 12,
          children: [
            TransactionInfo(
              participantName: "João Silva",
              type: "Depósito",
              amount: 150.00,
              color: Colors.blue,
            ),
            TransactionInfo(
              participantName: "Maria Santos",
              type: "Retirada",
              amount: 75.50,
              color: Colors.orange,
            ),
            TransactionInfo(
              participantName: "Pedro Costa",
              type: "Depósito",
              amount: 200.00,
              color: Colors.green,
            ),
          ],
        ),
      ],
    );
  }
}
