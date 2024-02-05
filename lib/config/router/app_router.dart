import 'package:anilistapp/presentation/presentation.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
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
