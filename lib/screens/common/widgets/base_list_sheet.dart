import 'package:flutter/material.dart';
import 'package:splitty/screens/common/widgets/custom_title.dart';
import 'package:splitty/utils/colors.dart';

class BaseListSheet extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? searchBar;
  final EdgeInsets contentPadding;
  final VoidCallback? onClose;

  const BaseListSheet({
    super.key,
    required this.title,
    required this.child,
    this.searchBar,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 10, 16, 20),
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      color: AppColors.background,
      child: Padding(
        padding: contentPadding,
        child: Column(
          children: [
            Container(
              width: 52,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(999),
              ),
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                Expanded(child: CustomTitle(title: title, fontSize: 26)),
                TextButton(
                  onPressed: onClose ?? () => Navigator.of(context).pop(),
                  child: const Text('Fechar'),
                ),
              ],
            ),
            if (searchBar != null) ...[const SizedBox(height: 8), searchBar!],
            const SizedBox(height: 8),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
