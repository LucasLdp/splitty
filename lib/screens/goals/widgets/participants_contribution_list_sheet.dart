import 'package:flutter/material.dart';
import 'package:splitty/screens/common/widgets/base_list_sheet.dart';
import 'package:splitty/screens/common/widgets/custom_input_search.dart';
import 'package:splitty/utils/format_currency.dart';

class ParticipantsContributionListSheet extends StatelessWidget {
  final List<ParticipantContribution> participants;

  const ParticipantsContributionListSheet({
    super.key,
    required this.participants,
  });

  @override
  Widget build(BuildContext context) {
    return BaseListSheet(
      title: 'Lista de participantes',
      searchBar: const CustomInputSearch(),
      child: participants.isEmpty
          ? const Center(child: Text('Nenhum participante encontrado.'))
          : ListView.separated(
              itemCount: participants.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (_, index) => ParticipantContributionTile(
                participant: participants[index],
                showRemoveAction: true,
              ),
            ),
    );
  }
}

class ParticipantContributionTile extends StatelessWidget {
  final ParticipantContribution participant;
  final String? subtitle;
  final bool showRemoveAction;

  const ParticipantContributionTile({
    super.key,
    required this.participant,
    this.subtitle,
    this.showRemoveAction = false,
  });

  @override
  Widget build(BuildContext context) {
    final isPositive = participant.amount >= 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD8E0E6)),
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 22, backgroundColor: participant.avatarColor),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  participant.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
              ],
            ),
          ),
          Text(
            '${isPositive ? '+' : '-'}${formatCurrency(participant.amount.abs())}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isPositive
                  ? const Color(0xFF3BB273)
                  : const Color(0xFFE06666),
            ),
          ),
          if (showRemoveAction) ...[
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${participant.name} sera removido em breve.',
                    ),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(Icons.delete_outline),
              tooltip: 'Remover participante',
              color: const Color(0xFFB54747),
              visualDensity: VisualDensity.compact,
            ),
          ],
        ],
      ),
    );
  }
}

class ParticipantContribution {
  final String name;
  final double amount;

  const ParticipantContribution({required this.name, required this.amount});

  Color get avatarColor {
    final hash = name.runes.fold<int>(0, (acc, rune) => acc + rune);

    const palette = [
      Color(0xFF0E5A5A),
      Color(0xFF5A84B4),
      Color(0xFFE99843),
      Color(0xFF6C9A8B),
      Color(0xFF8558C4),
    ];

    return palette[hash % palette.length];
  }
}
