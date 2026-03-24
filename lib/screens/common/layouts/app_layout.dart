import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:splitty/screens/common/navigation/app_bottom_nav.dart';
import 'package:splitty/screens/common/navigation/app_tab.dart';

class AppLayout extends StatelessWidget {
  final Widget child;

  const AppLayout({super.key, required this.child});

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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Expanded(child: child)],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: AppBottomNav(
          selectedRoute: selectedTab.route,
          tabs: tabs,
          onTapRoute: (route) {
            if (!currentRoute.startsWith(route)) {
              context.go(route);
            }
          },
        ),
      ),
    );
  }
}
