import 'package:anilistapp/infrastructure/models/media/media.dart';

class PageMediaModel {
  final List<MediaModel> media;

  PageMediaModel({
    required this.media,
  });

  factory PageMediaModel.fromJson(Map<String, dynamic> json) {
    return PageMediaModel(
      media:
          (json['media'] as List).map((e) => MediaModel.fromJson(e)).toList(),
    );
  }
}
