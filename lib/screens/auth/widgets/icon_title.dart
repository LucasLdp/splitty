import 'package:flutter/material.dart';

class IconTile extends StatelessWidget {
  // IconTile Props
  final IconData icon;
  final String description;
  final Color backgroundColor;
  final Color iconColor;

  const IconTile({
    super.key,
    required this.icon,
    required this.description,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: iconColor, size: 32),
        ),
        const SizedBox(width: 8),
        Text(description, style: const TextStyle(fontSize: 16)),
      ],
    );
  }
}
