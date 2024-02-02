import 'package:anilistapp/infrastructure/models/media/media_trending_model.dart';

class MediaPageTrendingModel {
  MediaPageTrendingModel({required this.mediaTrending});
  final List<MediaTrendModel> mediaTrending;

  factory MediaPageTrendingModel.fromJson(Map<String, dynamic> json) {
    return MediaPageTrendingModel(
      mediaTrending: (json['mediaTrends'] as List)
          .map((e) => MediaTrendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
