import 'package:flutter/material.dart';
import 'package:splitty/screens/common/widgets/custom_input_search.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';

class GoalsListHeader extends StatelessWidget {
  const GoalsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: 'Suas metas'),
        const CustomInputSearch(),
      ],
    );
  }
}
