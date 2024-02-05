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
      body: media$.when(
        data: (media) => _MediaScreenView(media),
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

class _MediaScreenView extends StatelessWidget {
  const _MediaScreenView(this.media);

  final MediaEntity media;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          foregroundColor: Colors.white,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            titlePadding: const EdgeInsets.symmetric(horizontal: 16.0),
            title: Text(media.title),
            background: Stack(
              children: [
                Image.network(
                  media.coverImage,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0],
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Text(
                  media.genres.join(', '),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Html(
                  data: media.description,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
