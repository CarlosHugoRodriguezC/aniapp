import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MediaHeader extends StatelessWidget {
  const MediaHeader({
    super.key,
    required this.bannerImage,
    required this.coverImage,
    required this.title,
    required this.genres,
  });

  final String bannerImage;
  final String coverImage;
  final String title;
  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    final TextTheme(:titleLarge, :titleSmall) = Theme.of(context).textTheme;
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Stack(
        children: [
          Image.network(
            bannerImage,
            height: 0.30.sh,
            fit: BoxFit.cover,
          ),
          Positioned(
            child: Container(
              width: 1.sw,
              height: 0.30.sh,
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
                coverImage,
                height: 250.h,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0.025.sw,
            width: 0.45.sw,
            height: 0.30.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: titleLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  genres.join(', '),
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
    );
  }
}


class MediaHeaderLoading extends StatelessWidget {
  const MediaHeaderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            height: 0.30.sh,
          ),
          Positioned(
            bottom: 0.01.sh,
            right: 0.5.sw,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10),
              ),
              height: 250.h,
              width: 150.w,
            ),
          ),
          Positioned(
            top: 0,
            right: 0.025.sw,
            width: 0.45.sw,
            height: 0.30.sh,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 18.h,
                  width: 100.w,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: 14.h,
                  width: 100.w,
                ),
                SizedBox(
                  height: 5.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}