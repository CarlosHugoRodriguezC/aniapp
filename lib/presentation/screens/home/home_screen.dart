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
    final homeMediaListsAsync = ref.watch(getHomeMediaListsProvider);
    final mostPopularAsync = ref.watch(getTheMostPopularMediaProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            mostPopularAsync.when(
              data: (media) => MainBanner(
                media: media,
                onMoreDetails: () => context.push('/media/${media.id}'),
                onFavorite: () {},
                onShare: () {},
              ),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
              loading: () => const MainBannerLoading(),
            ),
            const SizedBox(height: 16),
            homeMediaListsAsync.when(
              data: (medias) {
                return Column(
                  children: [
                    MediaSectionSlider(
                      medias: medias.seasonalMedia,
                      title: 'Seasonal Animes',
                      onTapSlide: (id) => context.push('/media/$id'),
                    ),
                    MediaSectionSlider(
                      medias: medias.popularMedia,
                      title: 'Popular Animes',
                      onTapSlide: (id) => context.push('/media/$id'),
                    ),
                    MediaSectionSlider(
                      medias: medias.trendingMedia,
                      title: 'Trending Animes',
                      onTapSlide: (id) => context.push('/media/$id'),
                    ),
                    MediaSectionSlider(
                      medias: medias.nextSeasonMedia,
                      title: 'Next Season Animes',
                      onTapSlide: (id) => context.push('/media/$id'),
                    ),
                    MediaSectionSlider(
                      medias: medias.topMedia,
                      title: 'Top Animes',
                      onTapSlide: (id) => context.push('/media/$id'),
                    )
                  ],
                );
              },
              loading: () => Column(
                children: [
                  MediaSectionSliderLoading(),
                  MediaSectionSliderLoading(),
                ],
              ),
              error: (error, stackTrace) {
                debugPrint('Error: $error');
                debugPrintStack(stackTrace: stackTrace);
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
