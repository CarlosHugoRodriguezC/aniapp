import 'package:anilistapp/domain/entities/media_entity.dart';
import 'package:anilistapp/presentation/providers/media/media_providers.dart';
import 'package:anilistapp/presentation/screens/media/widgets/media_content.dart';
import 'package:anilistapp/presentation/screens/media/widgets/media_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaScreen extends ConsumerWidget {
  const MediaScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final media$ = ref.watch(getMediaByIdProvider(int.parse(id)));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(
            media$: media$,
          ),
          _ViewContent(media$: media$),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  const _AppBar({
    required this.media$,
  });

  final AsyncValue<MediaEntity> media$;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 0.40.sh,
      foregroundColor: Colors.white,
      flexibleSpace: media$.when(
        data: (media) => MediaHeader(
          bannerImage: media.bannerImage,
          coverImage: media.coverImage,
          title: media.title,
          genres: media.genres,
        ),
        loading: () => const MediaHeaderLoading(),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class _ViewContent extends StatelessWidget {
  const _ViewContent({
    required this.media$,
  });

  final AsyncValue<MediaEntity> media$;

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      media$.when(
        data: (media) {
          return MediaContent(
            description: media.description,
            characters: media.characters ?? [],
            trailer: media.trailer,
          );
        },
        loading: () => const MediaContentLoading(),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    ]));
  }
}
