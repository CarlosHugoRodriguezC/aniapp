import 'package:anilistapp/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/home',
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [
    ShellRoute(
      builder: (context, state, child) => MainLayout(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
      ],
    ),
    GoRoute(
      path: '/media/:id',
      builder: (context, state) {
        final GoRouterState(:pathParameters) = state;
        final id = pathParameters['id'];

        if (id == null) {
          return const NotFoundScreen();
        }

        return MediaScreen(
          id: id,
        );
      },
    ),
  ],
);
