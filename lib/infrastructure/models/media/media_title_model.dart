import 'package:anilistapp/infrastructure/models/json_serializable/json_serializable_model.dart';

class MediaTitle extends JsonSerializableModel {
  final String romaji;
  final String? english;

  MediaTitle({
    required this.romaji,
    required this.english,
  });

  MediaTitle copyWith({
    String? romaji,
    String? english,
  }) =>
      MediaTitle(
        romaji: romaji ?? this.romaji,
        english: english ?? this.english,
      );

  @override
  factory MediaTitle.fromJson(Map<String, dynamic> json) => MediaTitle(
        romaji: json["romaji"] ?? 'No available',
        english: json["english"] ?? 'No available',
      );

  @override
  Map<String, dynamic> toJson() => {
        "romaji": romaji,
        "english": english,
      };
}
