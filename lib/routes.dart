import 'package:go_router/go_router.dart';
import 'package:splitty/screens/auth/page/auth_screen.dart';
import 'package:splitty/screens/common/layouts/app_layout.dart';
import 'package:splitty/screens/goals/page/goal_detail_screen.dart';
import 'package:splitty/screens/goals/page/goals_list_screen.dart';
import 'package:splitty/screens/home/page/home_screen.dart';
import 'package:splitty/screens/profile/page/profile_screen.dart';

class RouteConfig {
  static const homeRouteName = 'home';
  static const goalsRouteName = 'goals';
  static const goalDetailRouteName = 'goal-detail';
  static const profileRouteName = 'profile';

  static final GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (ctx, state) => const AuthScreen()),
      ShellRoute(
        builder: (ctx, state, child) {
          final goalId = state.pathParameters['id'];
          final isGoalDetailRoute = goalId != null;

          return AppLayout(
            showBottomNavigationBar: !isGoalDetailRoute,
            child: child,
          );
        },
        routes: [
          GoRoute(
            name: homeRouteName,
            path: '/home',
            builder: (ctx, state) => const HomeScreen(),
          ),
          GoRoute(
            name: goalsRouteName,
            path: '/goals',
            builder: (ctx, state) => const GoalsListScreen(),
            routes: [
              GoRoute(
                name: goalDetailRouteName,
                path: ':id',
                builder: (ctx, state) {
                  final id = state.pathParameters['id'] ?? '';
                  final titleFromExtra = state.extra is String
                      ? state.extra as String
                      : null;

                  return GoalDetailScreen(
                    title: titleFromExtra ?? 'Detalhes da Meta #$id',
                  );
                },
              ),
            ],
          ),
          GoRoute(
            name: profileRouteName,
            path: '/profile',
            builder: (ctx, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
