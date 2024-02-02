import 'package:anilistapp/infrastructure/models/media/media_model.dart';

class MediaTrendModel {
  final int mediaId;
  final int trending;
  final dynamic episode;
  final int averageScore;
  final int date;
  final MediaModel media;

  MediaTrendModel({
    required this.mediaId,
    required this.trending,
    required this.episode,
    required this.averageScore,
    required this.date,
    required this.media,
  });

  @override
  factory MediaTrendModel.fromJson(Map<String, dynamic> json) {
    return MediaTrendModel(
      mediaId: json['mediaId'] as int,
      trending: json['trending'] as int,
      episode: json['episode'],
      averageScore: json['averageScore'] as int,
      date: json['date'] as int,
      media: MediaModel.fromJson(json['media'] as Map<String, dynamic>),
    );
  }
}
