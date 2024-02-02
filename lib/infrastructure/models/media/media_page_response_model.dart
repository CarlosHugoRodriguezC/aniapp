import 'package:anilistapp/infrastructure/models/media/media_page_model.dart';

class MediaPageResponseModel {
  MediaPageResponseModel({required this.data});

  final MediaPageModel data;

  factory MediaPageResponseModel.fromJson(Map<String, dynamic> json) {
    return MediaPageResponseModel(
      data: MediaPageModel.fromJson(json['Page']),
    );
  }
}
