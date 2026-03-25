import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NonTabScreenLayout extends StatelessWidget {
  final Widget child;
  final String fallbackRoute;

  const NonTabScreenLayout({
    super.key,
    required this.child,
    this.fallbackRoute = '/home',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              context.pop();
              return;
            }
            context.go(fallbackRoute);
          },
          padding: EdgeInsets.zero,
          alignment: Alignment.centerLeft,
          constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
          icon: const Icon(Icons.arrow_back),
        ),
        const SizedBox(height: 16),
        Expanded(child: child),
      ],
    );
  }
}
