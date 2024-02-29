import 'package:anilistapp/domain/domain.dart';

class HomeListsEntity {
  final List<MediaEntity> trendingMedia;
  final List<MediaEntity> seasonalMedia;
  final List<MediaEntity> nextSeasonMedia;
  final List<MediaEntity> popularMedia;
  final List<MediaEntity> topMedia;

  HomeListsEntity({
    required this.trendingMedia,
    required this.seasonalMedia,
    required this.nextSeasonMedia,
    required this.popularMedia,
    required this.topMedia,
  });

  HomeListsEntity copyWith({
    List<MediaEntity>? trendingMedia,
    List<MediaEntity>? seasonalMedia,
    List<MediaEntity>? nextSeasonMedia,
    List<MediaEntity>? popularMedia,
    List<MediaEntity>? topMedia,
  }) {
    return HomeListsEntity(
      trendingMedia: trendingMedia ?? this.trendingMedia,
      seasonalMedia: seasonalMedia ?? this.seasonalMedia,
      nextSeasonMedia: nextSeasonMedia ?? this.nextSeasonMedia,
      popularMedia: popularMedia ?? this.popularMedia,
      topMedia: topMedia ?? this.topMedia,
    );
  }

  @override
  String toString() {
    return 'HomeListEntity(trendingMedia: $trendingMedia, seasonalMedia: $seasonalMedia, nextSeasonMedia: $nextSeasonMedia, popularMedia: $popularMedia, topMedia: $topMedia)';
  }
}
