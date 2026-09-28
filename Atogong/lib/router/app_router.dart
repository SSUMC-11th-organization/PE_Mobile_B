import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/sign_up/sign_up_screen.dart';
import '../screens/start/start_screen.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: '/start',
    routes: [
      GoRoute(path: '/start', builder: (context, state) => const StartScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const _Placeholder('홈'),
      ),
      GoRoute(
        path: '/movies',
        builder: (context, state) => const _Placeholder('영화 목록'),
        routes: [
          GoRoute(
            path: ':movieId',
            builder: (context, state) =>
                _Placeholder('상세 ${state.pathParameters['movieId']}'),
          ),
        ],
      ),
      GoRoute(
        path: '/my',
        builder: (context, state) => const _Placeholder('마이페이지'),
      ),
    ],
  );
}

// Step 2~3에서 실제 화면으로 교체 후 삭제
class _Placeholder extends StatelessWidget {
  const _Placeholder(this.label);
  final String label;

  @override
  Widget build(BuildContext context) =>
      Scaffold(body: Center(child: Text(label)));
}
