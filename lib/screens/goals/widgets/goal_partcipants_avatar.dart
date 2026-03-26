import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

class GoalPartcipantsAvatar extends StatelessWidget {
  final List<String> participants;
  final double radius;
  final double overlap;

  const GoalPartcipantsAvatar({
    super.key,
    required this.participants,
    required this.radius,
    required this.overlap,
  });

  Color _randomAvatarColor() {
    return RandomColor.getColorObject(Options(luminosity: Luminosity.dark));
  }

  String _initialFromName(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      return '?';
    }

    return trimmed[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final diameter = radius * 2;
    final totalWidth = participants.isEmpty
        ? 0.0
        : diameter + (participants.length - 1) * (diameter - overlap);

    return SizedBox(
      height: diameter,
      width: totalWidth,
      child: Stack(
        children: List.generate(participants.length, (index) {
          final left = index * (diameter - overlap);
          final participantName = participants[index];
          final color = _randomAvatarColor();
          final fallbackInitial = _initialFromName(participantName);

          return Positioned(
            left: left,
            child: CircleAvatar(
              radius: radius,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: radius - 1,
                backgroundColor: color,
                child: Text(
                  fallbackInitial,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
