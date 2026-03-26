import 'package:go_router/go_router.dart';
import 'package:splitty/screens/auth/page/auth_screen.dart';
import 'package:splitty/screens/common/layouts/app_layout.dart';
import 'package:splitty/screens/goals/page/goal_detail_screen.dart';
import 'package:splitty/screens/goals/page/goal_transaction.dart';
import 'package:splitty/screens/goals/page/goals_list_screen.dart';
import 'package:splitty/screens/goals/page/new_goal_screen.dart';
import 'package:splitty/screens/home/page/home_screen.dart';
import 'package:splitty/screens/profile/page/profile_screen.dart';

class RouteConfig {
  static String getGoalDetailTitle(GoRouterState state) {
    final id = state.pathParameters['id'] ?? '';
    final titleFromExtra = state.extra is String ? state.extra as String : null;
    return titleFromExtra ?? 'Detalhes da Meta #$id';
  }

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
            name: 'home',
            path: '/home',
            builder: (ctx, state) => const HomeScreen(),
          ),
          GoRoute(
            name: 'goals',
            path: '/goals',
            builder: (ctx, state) => const GoalsListScreen(),
            routes: [
              GoRoute(
                name: 'goal-detail',
                path: ':id',
                builder: (ctx, state) {
                  final title = getGoalDetailTitle(state);
                  final goalId = state.pathParameters['id'] ?? '';
                  return GoalDetailScreen(title: title, goalId: goalId);
                },
                routes: [
                  GoRoute(
                    name: 'goal-transaction',
                    path: 'transaction',
                    builder: (ctx, state) => const GoalTransaction(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: 'new-goal',
            path: '/new-goal',
            builder: (ctx, state) => const NewGoalScreen(),
          ),
          GoRoute(
            name: 'profile',
            path: '/profile',
            builder: (ctx, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
