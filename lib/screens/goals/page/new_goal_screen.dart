import 'package:flutter/material.dart';
import 'package:splitty/screens/common/layouts/non_tab_screen_layout.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';
import 'package:splitty/screens/goals/widgets/goal_amount_summary_card.dart';
import 'package:splitty/screens/goals/widgets/goal_basic_form.dart';
import 'package:splitty/screens/goals/widgets/goal_objectives_section.dart';
import 'package:splitty/screens/goals/widgets/goal_mode_switch.dart';
import 'package:splitty/utils/colors.dart';

class NewGoalScreen extends StatefulWidget {
  const NewGoalScreen({super.key});

  @override
  State<NewGoalScreen> createState() => _NewGoalScreenState();
}

class _NewGoalScreenState extends State<NewGoalScreen> {
  final _nameController = TextEditingController();
  final _periodController = TextEditingController();
  final _singleAmountController = TextEditingController();
  final _objectiveNameController = TextEditingController();
  final _objectiveAmountController = TextEditingController();

  final List<GoalObjective> _objectives = [];

  @override
  void dispose() {
    _nameController.dispose();
    _periodController.dispose();
    _singleAmountController.dispose();
    _objectiveNameController.dispose();
    _objectiveAmountController.dispose();
    super.dispose();
  }

  double _parseAmount(String value) {
    final sanitized = value.replaceAll(',', '.');
    return double.tryParse(sanitized) ?? 0.0;
  }

  void _addObjective() {
    final name = _objectiveNameController.text.trim();
    final amount = _parseAmount(_objectiveAmountController.text);

    if (name.isEmpty || amount <= 0) {
      return;
    }

    setState(() {
      _objectives.add(GoalObjective(name: name, amount: amount));
      _objectiveNameController.clear();
      _objectiveAmountController.clear();
    });
  }

  void _removeObjective(int index) {
    setState(() {
      _objectives.removeAt(index);
    });
  }

  GoalMode _mode = GoalMode.single;

  double? _getPlannedAmount() {
    if (_mode == GoalMode.single) {
      final amount = _parseAmount(_singleAmountController.text);
      return amount > 0 ? amount : null;
    }

    if (_objectives.isEmpty) {
      return null;
    }

    return _objectives.fold<double>(0, (sum, item) => sum + item.amount);
  }

  @override
  Widget build(BuildContext context) {
    final plannedAmount = _getPlannedAmount();

    return NonTabScreenLayout(
      child: ListView(
        children: [
          const CustomTitle(title: 'Registrar nova meta'),
          const Text('Defina metas e objetivos e acompanhe seu progresso'),
          const SizedBox(height: 16),
          GoalAmountSummaryCard(
            plannedAmount: plannedAmount,
            depositedAmount: null,
            showDepositText: false,
          ),
          const SizedBox(height: 16),
          GoalBasicForm(
            nameController: _nameController,
            periodController: _periodController,
          ),
          const SizedBox(height: 16),
          GoalObjectivesSection(
            mode: _mode,
            objectives: _objectives,
            singleAmountController: _singleAmountController,
            objectiveNameController: _objectiveNameController,
            objectiveAmountController: _objectiveAmountController,
            onModeChanged: (mode) => setState(() => _mode = mode),
            onObjectiveAdd: _addObjective,
            onObjectiveRemove: _removeObjective,
            onSingleAmountChanged: () => setState(() {}),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Criar caixinha'),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
