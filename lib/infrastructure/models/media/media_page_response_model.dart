import 'package:anilistapp/infrastructure/models/media/media_page_model.dart';

class MediaPageResponseModel {
  MediaPageResponseModel({required this.page});

  final MediaPageModel page;

  factory MediaPageResponseModel.fromJson(Map<String, dynamic> json) {
    return MediaPageResponseModel(
      page: MediaPageModel.fromJson(json['Page']),
    );
  }
}
