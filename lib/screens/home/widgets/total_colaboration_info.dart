import 'package:flutter/material.dart';
import 'package:splitty/utils/format_currency.dart';

class TotalColaborationInfo extends StatelessWidget {
  final double totalColaboration;
  const TotalColaborationInfo({super.key, required this.totalColaboration});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 4,
          children: [
            Text(
              'Patrimônio Colaborativo',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
            ),
            Text(
              formatCurrency(totalColaboration),
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                letterSpacing: -2,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Meta do mês: 70% concluída',
              style: TextStyle(fontSize: 16, color: Colors.greenAccent),
            ),
          ],
        ),
      ),
    );
  }
}
