import 'package:anilistapp/infrastructure/models/graph_response/graph_data_model.dart';
import 'package:anilistapp/infrastructure/models/media/media_page_model.dart';

class MediaPageResponseModel
    extends GraphDataModel<MediaPageModel> {
  MediaPageResponseModel({required super.data});

  factory MediaPageResponseModel.fromJson(Map<String, dynamic> json) {
    return MediaPageResponseModel(
      data: MediaPageModel.fromJson(json['Page']),
    );
  }
}
