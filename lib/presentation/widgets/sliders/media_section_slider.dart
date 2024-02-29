import 'package:anilistapp/domain/domain.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaSectionSlider extends StatefulWidget {
  const MediaSectionSlider({
    super.key,
    required this.medias,
    this.title,
    this.subtitle,
    this.loadNextPage,
    this.onTapSlide,
  });

  final List<MediaEntity> medias;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;
  final void Function(int id)? onTapSlide;

  @override
  State<MediaSectionSlider> createState() => _MediaSectionSliderState();
}

class _MediaSectionSliderState extends State<MediaSectionSlider> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (widget.loadNextPage == null) return;
      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 310,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null) ...[
            _Title(
              title: widget.title,
              subtitle: widget.subtitle,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.medias.length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                final MediaEntity(:title, :coverImage, :id) =
                    widget.medias[index];
                return FadeInRight(
                  child: _Slide(
                    title: title,
                    subtitle: "Subtitle",
                    posterPath: coverImage,
                    onTap: widget.onTapSlide != null
                        ? () => widget.onTapSlide!(id)
                        : null,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    required this.title,
    required this.subtitle,
    required this.posterPath,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String posterPath;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE: Image
          SizedBox(
            width: 150,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                posterPath,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  }
                  return FadeIn(
                    child: GestureDetector(
                      onTap: onTap,
                      child: child,
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(
            height: 5,
          ),
          // NOTE: title
          SizedBox(
            width: 150,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: textStyle.titleSmall,
            ),
          ),
          // NOTE: Raiting

          // SizedBox(
          //   width: 150,
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.star_half_outlined,
          //         color: Colors.yellow.shade800,
          //       ),
          //       const SizedBox(
          //         width: 3,
          //       ),
          //       Text(
          //         '${movie.voteAverage}',
          //         style: textStyle.bodyMedium?.copyWith(
          //           color: Colors.yellow.shade800,
          //         ),
          //       ),
          //       const Spacer(),
          //       Text(
          //         HumanFormats.number(movie.popularity),
          //         style: textStyle.bodySmall,
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final TextTheme(:titleMedium) = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleMedium,
            ),
          const Spacer(),
          if (subtitle != null)
            FilledButton.tonal(
              onPressed: () {},
              style: const ButtonStyle(
                visualDensity: VisualDensity.compact,
              ),
              child: Text(subtitle!),
            )
        ],
      ),
    );
  }
}

class MediaSectionSliderLoading extends StatelessWidget {
  const MediaSectionSliderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
    );

    return SizedBox(
      height: 310,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Container(
              decoration: decoration,
              height: 16.h,
              width: 100.w,
            ),
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 10.w,
              ),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 150.w,
                    height: 200.h,
                    decoration: decoration,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: decoration,
                    height: 16.h,
                    width: 100.w,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: decoration,
                    height: 16.h,
                    width: 50.w,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
