import 'package:flutter/material.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';
import 'package:splitty/screens/home/widgets/transactions_list_sheet.dart';
import 'package:splitty/utils/colors.dart';

class GoalTransactionsList extends StatelessWidget {
  final List<TransactionItem> transactions;

  const GoalTransactionsList({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    if (transactions.isEmpty) {
      return const SizedBox.shrink();
    }

    final preview = transactions.take(2).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Expanded(
              child: CustomTitle(title: 'Movimentações', fontSize: 24),
            ),
            TextButton.icon(
              onPressed: () => _openTransactionsSheet(context),
              icon: const Icon(Icons.receipt_long),
              label: const Text('Ver lista'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        for (final transaction in preview) ...[
          TransactionListTile(transaction: transaction),
          const SizedBox(height: 12),
        ],
      ],
    );
  }

  void _openTransactionsSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.background,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (_) => TransactionsListSheet(transactions: transactions),
    );
  }
}
