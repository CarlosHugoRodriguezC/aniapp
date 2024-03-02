import 'package:anilistapp/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MediaContent extends StatelessWidget {
  const MediaContent({
    super.key,
    required this.description,
    required this.characters,
    this.trailer,
  });

  final String description;
  final List<CharacterEntity> characters;
  final TrailerEntity? trailer;

  @override
  Widget build(BuildContext context) {
    final TextTheme(:titleSmall) = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Text(
            'Description',
            style: titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 16.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Html(
            data: description,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Text(
            'Characters',
            style: titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 0.30.sh,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return Container(
                margin: EdgeInsets.only(right: 0.05.sw),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.r),
                      ),
                      child: Image.network(
                        character.image,
                        height: 0.25.sh,
                      ),
                    ),
                    Text(
                      character.name,
                      maxLines: 1,
                      style: titleSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Text(
            'Trailer',
            style: titleSmall?.copyWith(
              fontWeight: FontWeight.w900,
              fontSize: 16.sp,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: ColoredBox(
              color: Colors.red,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: trailer != null
                    ? YoutubePlayer(
                        controller: YoutubePlayerController(
                          initialVideoId: trailer?.id ?? '',
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                            mute: false,
                          ),
                        ),
                      )
                    : null,
                // child: Image.network(
                //   media.trailer?.thumbnail ??
                //       'https://via.placeholder.com/150',
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class MediaContentLoading extends StatelessWidget {
  const MediaContentLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 5.h),
          child: Container(
            decoration: boxDecoration,
            height: 16.h,
            width: 0.50.sw,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 5.h),
          child: Container(
            decoration: boxDecoration,
            height: 16.h,
            width: 1.sw,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 5.h),
          child: Container(
            decoration: boxDecoration,
            height: 16.h,
            width: 1.sw,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 5.h),
          child: Container(
            decoration: boxDecoration,
            height: 16.h,
            width: 1.sw,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Container(
            decoration: boxDecoration,
            height: 16.h,
            width: 0.50.sw,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 0.30.sh,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
            itemCount: 5,
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 0.35.sw,
                    height: 0.25.sh,
                    decoration: boxDecoration,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    decoration: boxDecoration,
                    height: 14.h,
                    width: 0.25.sw,
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: Container(
            decoration: boxDecoration,
            height: 16.h,
            width: 0.50.sw,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: ColoredBox(
              color: Colors.grey[300]!,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
