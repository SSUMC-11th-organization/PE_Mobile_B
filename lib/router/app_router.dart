import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/movie_detail_screen.dart';
import '../screens/movie_list_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/sign_up_screen.dart';
import '../screens/start_screen.dart';
import '../widgets/main_screen.dart';

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
        path: '/movies/:movieId',
        builder: (context, state) => MovieDetailScreen(
          movieId: int.parse(state.pathParameters['movieId']!),
        ),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(
            currentIndex: MainScreen.indexFromLocation(state.uri.path),
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
    ],
  );
}
