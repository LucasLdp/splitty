import 'package:flutter/material.dart';
import 'package:splitty/screens/common/widgets/custom_input_search.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';

class GroupsHeader extends StatelessWidget {
  const GroupsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTitle(title: "Seus grupos"),
        const CustomInputSearch(),
      ],
    );
  }
}
