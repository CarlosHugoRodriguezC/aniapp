import 'package:anilistapp/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainLayout extends ConsumerWidget {
  const MainLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomBarIndexProvider);
    final ColorScheme(:background) = Theme.of(context).colorScheme;
    return Scaffold(
        body: child,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedIndex,
          backgroundColor: background,
          elevation: 0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              selectedIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              label: 'Search',
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_outlined),
              selectedIcon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              label: 'Library',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              selectedIcon: Icon(
                Icons.person,
                color: Colors.red,
              ),
              label: 'Profile',
            ),
          ],
          onDestinationSelected: (index) {
            ref.read(bottomBarIndexProvider.notifier).setIndex(index);
            switch (index) {
              case 0:
                context.go('/home');
              case 1:
                context.go('/search');
              case 2:
                context.go('/library');
              case 3:
                context.go('/profile');
            }
          },
        ));
  }
}
