import 'package:go_router/go_router.dart';
import 'package:splitty/screens/auth/page/auth_screen.dart';
import 'package:splitty/screens/common/layouts/app_layout.dart';
import 'package:splitty/screens/activity/page/activity_screen.dart';
import 'package:splitty/screens/groups/page/groups_screen.dart';
import 'package:splitty/screens/home/page/home_screen.dart';
import 'package:splitty/screens/profile/page/profile_screen.dart';

class RouteConfig {
  static final routes = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (ctx, state) => const AuthScreen()),
      ShellRoute(
        builder: (ctx, state, child) => AppLayout(child: child),
        routes: [
          GoRoute(path: '/home', builder: (ctx, state) => const HomeScreen()),
          GoRoute(
            path: '/groups',
            builder: (ctx, state) => const GroupsScreen(),
          ),
          GoRoute(
            path: '/activity',
            builder: (ctx, state) => const ActivityScreen(),
          ),
          GoRoute(
            path: '/profile',
            builder: (ctx, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
