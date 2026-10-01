import 'package:go_router/go_router.dart';
import 'package:jay/screens/main_screen.dart';
import 'package:jay/screens/profile_screen.dart';
import 'package:jay/screens/signup_screen.dart';

import '../screens/home_screen.dart';
import '../screens/movie_detail_screen.dart';
import '../screens/movie_list_screen.dart';
import '../screens/start_screen.dart';

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
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(
            currentIndex: indexFromLocation(state.uri.path),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const HomeScreen(),
          ),

          GoRoute(
            path: '/movies',
            builder: (context, state) => const MovieListScreen(),
          ),

          GoRoute(
            path: '/my',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
      // 상세는 NavigationBar 없이 전체 화면으로 보여주기 위해 ShellRoute 밖에 둔다
      GoRoute(
        path: '/movies/:movieId',
        builder: (context, state) =>
            MovieDetailScreen(movieId: state.pathParameters['movieId']!),
      ),
    ],
  );

  static int indexFromLocation(String path) {
    if (path.startsWith('/movies')) return 1;
    if (path.startsWith('/my')) return 2;
    return 0;
  }
}
