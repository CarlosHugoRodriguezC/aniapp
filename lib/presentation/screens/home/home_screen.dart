import 'package:anilistapp/presentation/providers/media/media_provider.dart';
import 'package:anilistapp/presentation/screens/home/widgets/main_banner.dart';
import 'package:anilistapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaList$ = ref.watch(getMediaListProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MainBanner(),
            const SizedBox(height: 16),
            mediaList$.when(
              data: (medias) => MediaSectionSlider(
                title: "Today's Selection",
                medias: medias,
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
