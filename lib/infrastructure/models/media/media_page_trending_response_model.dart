import 'package:anilistapp/infrastructure/models/media/media_trending_model.dart';

class MediaPageTrendingResponseModel {
  MediaPageTrendingResponseModel({required this.data});

  final List<MediaTrendModel> data;

  factory MediaPageTrendingResponseModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
    // return MediaPageTrendingResponseModel(
    //   data:  MediaTrendModel.fromJson(json['Page']['trending'] as Map<String, dynamic>);
    // );
  }
}
