import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitty/screens/common/navigation/app_bottom_nav.dart';
import 'package:splitty/screens/common/navigation/app_tab.dart';
import 'package:splitty/utils/colors.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final bool showBottomNavigationBar;

  const AppLayout({
    super.key,
    required this.child,
    this.showBottomNavigationBar = true,
  });

  static const List<AppTab> tabs = [
    AppTab(route: '/home', label: 'Início', icon: Icons.home_outlined),
    AppTab(route: '/goals', label: 'Metas', icon: Icons.flag_outlined),
    AppTab(route: '/profile', label: 'Perfil', icon: Icons.person_outline),
  ];

  @override
  Widget build(BuildContext context) {
    final String currentRoute = GoRouterState.of(context).uri.path;
    final AppTab selectedTab = tabs.firstWhere(
      (tab) => currentRoute.startsWith(tab.route),
      orElse: () => tabs.first,
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Container(
          color: AppColors.background,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: child)],
          ),
        ),
      ),
      bottomNavigationBar: showBottomNavigationBar
          ? SafeArea(
              child: AppBottomNav(
                selectedRoute: selectedTab.route,
                tabs: tabs,
                onTapRoute: (route) {
                  if (!currentRoute.startsWith(route)) {
                    context.go(route);
                  }
                },
              ),
            )
          : null,
    );
  }
}
