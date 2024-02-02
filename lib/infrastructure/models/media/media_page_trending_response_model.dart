import 'package:anilistapp/infrastructure/models/media/media_page_trending_model.dart';

class MediaPageTrendingResponseModel {
  MediaPageTrendingResponseModel({required this.page});

  final MediaPageTrendingModel page;

  factory MediaPageTrendingResponseModel.fromJson(Map<String, dynamic> json) {
    return MediaPageTrendingResponseModel(
      page: MediaPageTrendingModel.fromJson(json['Page']),
    );
  }
}
