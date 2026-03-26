import 'package:flutter/material.dart';
import 'package:splitty/utils/format_currency.dart';

class TransactionInfo extends StatelessWidget {
  final String participantName;
  final String type;
  final double amount;
  final Color color;

  const TransactionInfo({
    super.key,
    required this.participantName,
    required this.type,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDeposit = type.toLowerCase() == 'depósito';
    final icon = isDeposit ? Icons.arrow_downward : Icons.arrow_upward;
    final sign = isDeposit ? '+' : '-';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    participantName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    type,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),

          Text(
            '$sign${formatCurrency(amount)}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isDeposit ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
