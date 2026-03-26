import 'package:flutter/material.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';

class GoalTransactionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const GoalTransactionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTitle(title: title, fontSize: 32),
        const SizedBox(height: 4),
        Text(subtitle, style: TextStyle(color: Colors.grey.shade600)),
      ],
    );
  }
}
