import 'package:flutter/material.dart';
import 'package:splitty/screens/common/widgets/base_list_sheet.dart';
import 'package:splitty/screens/common/widgets/custom_input_search.dart';
import 'package:splitty/utils/format_currency.dart';

class TransactionsListSheet extends StatelessWidget {
  final List<TransactionItem> transactions;

  const TransactionsListSheet({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return BaseListSheet(
      title: 'Lista de movimentações',
      searchBar: const CustomInputSearch(),
      child: transactions.isEmpty
          ? const Center(child: Text('Nenhuma movimentação encontrada.'))
          : ListView.separated(
              itemCount: transactions.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, index) =>
                  TransactionListTile(transaction: transactions[index]),
            ),
    );
  }
}

class TransactionListTile extends StatelessWidget {
  final TransactionItem transaction;

  const TransactionListTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    final isPositive = transaction.amount >= 0;
    final sign = isPositive ? '+' : '-';
    final badgeColor = isPositive
        ? const Color(0xFF3BB273)
        : const Color(0xFFE06666);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD8E0E6)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: badgeColor.withValues(alpha: 0.18),
            child: Text(
              sign,
              style: TextStyle(
                color: badgeColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  transaction.subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Text(
            '$sign${formatCurrency(transaction.amount.abs())}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: badgeColor,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionItem {
  final String title;
  final String subtitle;
  final double amount;

  const TransactionItem({
    required this.title,
    required this.subtitle,
    required this.amount,
  });
}
