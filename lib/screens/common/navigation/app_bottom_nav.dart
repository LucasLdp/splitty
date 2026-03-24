import 'package:flutter/material.dart';
import 'package:splitty/screens/common/navigation/app_tab.dart';
import 'package:splitty/utils/colors.dart';

class AppBottomNav extends StatelessWidget {
  final String selectedRoute;
  final List<AppTab> tabs;
  final ValueChanged<String> onTapRoute;

  const AppBottomNav({
    super.key,
    required this.selectedRoute,
    required this.tabs,
    required this.onTapRoute,
  });

  @override
  Widget build(BuildContext context) {
    final int foundIndex = tabs.indexWhere(
      (tab) => selectedRoute.startsWith(tab.route),
    );
    final int selectedIndex = foundIndex < 0 ? 0 : foundIndex;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFFE4E8EB)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: AppColors.primary,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            final selected = states.contains(WidgetState.selected);
            return IconThemeData(
              color: selected ? Colors.white : const Color(0xFF7E8A93),
              size: 20,
            );
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final selected = states.contains(WidgetState.selected);
            return TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.3,
              color: selected ? AppColors.primary : const Color(0xFF7E8A93),
            );
          }),
        ),
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) => onTapRoute(tabs[index].route),
          destinations: tabs
              .map(
                (tab) => NavigationDestination(
                  icon: Icon(tab.icon),
                  label: tab.label,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
