import 'package:anilistapp/domain/entities/media_entity.dart';
import 'package:anilistapp/presentation/providers/media/media_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
    final TextTheme(:titleLarge, :titleSmall) = Theme.of(context).textTheme;

    return SliverAppBar(
      expandedHeight: 0.45.sh,
      foregroundColor: Colors.white,
      flexibleSpace: media$.when(
        data: (media) => FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Stack(
            children: [
              Image.network(
                media.bannerImage,
                height: 0.35.sh,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: Container(
                  width: 1.sw,
                  height: 0.35.sh,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: const [0.05, 0.25, 0.95],
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.01.sh,
                right: 0.5.sw,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  child: Image.network(
                    media.coverImage,
                    height: 250.h,
                  ),
                ),
              ),
              Positioned(
                top: 0.20.sh,
                right: 0.025.sw,
                width: 0.45.sw,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      media.title,
                      style: titleLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18.sp,
                      ),
                    ),
                    Text(
                      media.genres.join(', '),
                      style: titleSmall?.copyWith(
                        color: Colors.white70,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
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
          data: (media) => Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Html(
                  data: media.description,
                ),
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ]),
    );
  }
}
