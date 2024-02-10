import 'package:anilistapp/presentation/providers/providers.dart';
import 'package:anilistapp/presentation/screens/home/widgets/main_banner.dart';
import 'package:anilistapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaPopular$ = ref.watch(getMediaPopularOfSeasonYearProvider);
    final mediaList$ = ref.watch(getMediaListProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            mediaPopular$.when(
              data: (media) => MainBanner(
                media: media,
                onMoreDetails: () => context.push('/media/${media.id}'),
                onFavorite: () {},
                onShare: () {},
              ),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 16),
            mediaList$.when(
              data: (medias) => MediaSectionSlider(
                title: "Popular of season",
                medias: medias,
                onTapSlide: (id) => context.push('/media/$id'),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) {
                return Center(
                  child: Text('Error: $error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
