import 'package:flutter/material.dart';
import 'package:flutter_randomcolor/flutter_randomcolor.dart';

class SavingGoalItem extends StatelessWidget {
  final String goalName;
  final List<String> participants;
  final Color color;

  const SavingGoalItem({
    super.key,
    required this.goalName,
    required this.participants,
    this.color = const Color(0xFF0EA5A4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1F0F172A),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x330EA5A4),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                goalName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              _ParticipantsAvatars(
                participants: participants,
                radius: 12,
                overlap: 8,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ParticipantsAvatars extends StatelessWidget {
  final List<String> participants;
  final double radius;
  final double overlap;

  const _ParticipantsAvatars({
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
