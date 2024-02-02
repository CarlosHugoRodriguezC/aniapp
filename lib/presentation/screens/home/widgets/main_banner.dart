import 'package:anilistapp/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainBanner extends StatelessWidget {
  const MainBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final TextTheme(
      :titleLarge,
      :titleSmall,
    ) = Theme.of(context).textTheme;
    return Container(
      height: 400.h,
      width: double.infinity,
      child: Stack(
        children: [
          Image.network(
            'https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx151807-m1gX3iwfIsLu.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
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
                    Text(
                      'Solo leveling',
                      style: titleLarge,
                    ),
                    Text(
                      'Action, Adventure, Fantasy',
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
                          onPressed: () {},
                        ),
                        SizedBox(width: 10.w),
                        CustomIconButton(
                          icon: Icons.favorite_outline,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onPressed: () {},
                        ),
                        SizedBox(width: 10.w),
                        CustomIconButton(
                          icon: Icons.share_outlined,
                          backgroundColor: Colors.black.withOpacity(0.7),
                          onPressed: () {},
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
