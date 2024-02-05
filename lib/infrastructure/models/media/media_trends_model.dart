import 'package:anilistapp/infrastructure/models/media/media_model.dart';

class MediaTrendsModel {
  final int mediaId;
  final int? episode;
  final int trending;
  final bool releasing;
  final int averageScore;
  final int date;
  final MediaModel media;

  MediaTrendsModel({
    required this.mediaId,
    required this.episode,
    required this.trending,
    required this.releasing,
    required this.averageScore,
    required this.date,
    required this.media,
  });

  factory MediaTrendsModel.fromJson(Map<String, dynamic> json) {
    return MediaTrendsModel(
      mediaId: json['mediaId'],
      episode: json['episode'],
      trending: json['trending'],
      releasing: json['releasing'],
      averageScore: json['averageScore'],
      date: json['date'],
      media: MediaModel.fromJson(json['media']),
    );
  }
}
