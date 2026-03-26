import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitty/screens/auth/widgets/custom_button.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';
import 'package:splitty/screens/home/widgets/total_colaboration_info.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CustomTitle(title: 'Suas Metas'),
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/12345678?v=4',
              ),
            ),
          ],
        ),
        TotalColaborationInfo(totalColaboration: 100.00),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
            text: 'Nova contribuição',
            onPressed: () {
              context.go("/new-goal");
            },
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
