import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitty/utils/colors.dart';
import 'package:splitty/screens/auth/widgets/custom_button.dart';
import 'package:splitty/screens/auth/widgets/icon_title.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32.0),
              width: screenWidth * 0.9,
              child: Column(
                spacing: screenWidth * 0.05,
                children: [
                  Text(
                    'Seu dinheiro, suas metas, juntos.',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const Text(
                    'Crie grupos, defina metas e acompanhe o progresso financeiro de todos.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Column(
                    spacing: 16.0,
                    children: [
                      IconTile(
                        icon: Icons.group,
                        description: "Controle Total de colaboradores",
                        backgroundColor: AppColors.primarySoft,
                        iconColor: AppColors.primary,
                      ),
                      IconTile(
                        icon: Icons.attach_money,
                        description: "Acompanhe o progresso financeiro",
                        backgroundColor: AppColors.primarySoft,
                        iconColor: AppColors.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
              text: "Acesse Agora",
              onPressed: () => context.go('/home'),
            ),
          ],
        ),
      ),
    );
  }
}
