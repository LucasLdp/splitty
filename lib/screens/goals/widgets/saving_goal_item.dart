import 'package:flutter/material.dart';
import 'package:splitty/screens/goals/widgets/goal_partcipants_avatar.dart';

class SavingGoalItem extends StatelessWidget {
  final String goalName;
  final List<String> participants;
  final Color color;
  final VoidCallback? onTap;

  const SavingGoalItem({
    super.key,
    required this.goalName,
    required this.participants,
    this.color = const Color(0xFF0EA5A4),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        shadowColor: const Color(0x1F0F172A),
        elevation: 4,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 80,
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
                Expanded(
                  child: Column(
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
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      GoalPartcipantsAvatar(
                        participants: participants,
                        radius: 12,
                        overlap: 8,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Icon(
                    Icons.chevron_right,
                    color: Color(0xFF64748B),
                    size: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
