import 'package:anilistapp/infrastructure/models/json_serializable/json_serializable_model.dart';

class MediaCoverImageModel extends JsonSerializableModel {
  MediaCoverImageModel({
    this.color,
    required this.large,
    required this.medium,
    required this.extraLarge,
  });

  final String? color;
  final String large;
  final String medium;
  final String extraLarge;

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

  @override
  factory MediaCoverImageModel.fromJson(Map<String, dynamic> json) {
    return MediaCoverImageModel(
      color: json['color'] ?? 'No available',
      large: json['large'] ?? 'No available',
      medium: json['medium'] ?? 'No available',
      extraLarge: json['extraLarge'] ?? 'No available',
    );
  }
}
