import 'package:anilistapp/infrastructure/models/media/media_model.dart';

class MediaTrendModel {
  MediaTrendModel({
    required this.mediaId,
    required this.trending,
    this.episode,
    required this.averageScore,
    required this.date,
    required this.media,
  });

  final int mediaId;
  final int trending;
  final int? episode;
  final int averageScore;
  final int date;
  final MediaModel media;

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
