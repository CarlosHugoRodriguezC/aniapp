import 'package:anilistapp/infrastructure/models/json_serializable/json_serializable_model.dart';
import 'package:anilistapp/infrastructure/models/media/media_cover_image_model.dart';
import 'package:anilistapp/infrastructure/models/media/media_title_model.dart';

class MediaModel extends JsonSerializableModel {
  MediaModel({
    required this.id,
    required this.bannerImage,
    required this.title,
    required this.averageScore,
    required this.description,
    required this.coverImage,
  });

  final int id;
  final String? bannerImage;
  final MediaTitle title;
  final int averageScore;
  final String description;
  final MediaCoverImageModel coverImage;

  MediaModel copyWith({
    int? id,
    String? bannerImage,
    MediaTitle? title,
    int? averageScore,
    String? description,
    MediaCoverImageModel? coverImage,
  }) =>
      MediaModel(
        id: id ?? this.id,
        bannerImage: bannerImage ?? this.bannerImage,
        title: title ?? this.title,
        averageScore: averageScore ?? this.averageScore,
        description: description ?? this.description,
        coverImage: coverImage ?? this.coverImage,
      );

  @override
  factory MediaModel.fromJson(Map<String, dynamic> json) => MediaModel(
        id: json["id"],
        bannerImage: json["bannerImage"] ?? 'https://placehold.it/300x300',
        title: MediaTitle.fromJson(json["title"]),
        averageScore: json["averageScore"] ?? 0,
        description: json["description"],
        coverImage: MediaCoverImageModel.fromJson(json["coverImage"])
      );

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "bannerImage": bannerImage,
        "title": title.toJson(),
        "averageScore": averageScore,
        "description": description,
      };
}
