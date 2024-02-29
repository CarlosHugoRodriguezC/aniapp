import 'package:anilistapp/domain/entities/media_entity.dart';
import 'package:anilistapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({
    super.key,
    required this.media,
    this.onMoreDetails,
    this.onFavorite,
    this.onShare,
  });

  final MediaEntity media;
  final VoidCallback? onMoreDetails;
  final VoidCallback? onFavorite;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final TextTheme(
      :titleLarge,
      :titleSmall,
    ) = Theme.of(context).textTheme;

    return Container(
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.background,
        boxShadow: null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Image.network(
              media.coverImage,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.95],
                  colors: [
                    colorScheme.background.withOpacity(0.0),
                    colorScheme.background,
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        media.title,
                        style: titleLarge,
                        softWrap: true,
                      ),
                    ),
                    Text(
                      media.genres.join(', '),
                      style: titleSmall?.copyWith(
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        CustomFilledButton(
                          label: 'Details',
                          icon: Icons.arrow_forward_ios_outlined,
                          onPressed: onMoreDetails,
                        ),
                        SizedBox(width: 10.w),
                        CustomIconButton(
                          icon: Icons.favorite_outline,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onPressed: onFavorite,
                        ),
                        SizedBox(width: 10.w),
                        CustomIconButton(
                          icon: Icons.share_outlined,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onPressed: onShare,
                        )
                      ],
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class MainBannerLoading extends StatelessWidget {
  const MainBannerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final decoration = BoxDecoration(
      color: Colors.grey[300],
      boxShadow: null,
      borderRadius: BorderRadius.circular(10.r),
    );

    return Container(
      height: 350.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.background,
        boxShadow: null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Container(
              color: Colors.grey[300],
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 0.95],
                colors: [
                  colorScheme.background.withOpacity(0.0),
                  colorScheme.background,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 250.w,
                    child: Container(
                      decoration: decoration,
                      height: 30.h,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    decoration: decoration,
                    height: 20.h,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      const CustomFilledButton(
                        label: 'Details',
                        icon: Icons.arrow_forward_ios_outlined,
                        onPressed: null,
                      ),
                      SizedBox(width: 10.w),
                      CustomIconButton(
                        icon: Icons.favorite_outline,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        onPressed: null,
                      ),
                      SizedBox(width: 10.w),
                      CustomIconButton(
                        icon: Icons.share_outlined,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        onPressed: null,
                      )
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
