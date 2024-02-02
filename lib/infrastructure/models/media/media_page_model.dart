import 'package:anilistapp/infrastructure/models/json_serializable/json_serializable_model.dart';
import 'package:anilistapp/infrastructure/models/media/media_model.dart';

class MediaPageModel extends JsonSerializableModel {
  final List<MediaModel> media;

  MediaPageModel({
    required this.media,
  });

  MediaPageModel copyWith({
    List<MediaModel>? media,
  }) =>
      MediaPageModel(
        media: media ?? this.media,
      );

  @override
  factory MediaPageModel.fromJson(Map<String, dynamic> json) => MediaPageModel(
        media: List<MediaModel>.from(json["media"].map((x) => MediaModel.fromJson(x))),
      );

  @override
  Map<String, dynamic> toJson() => {
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
      };
}
