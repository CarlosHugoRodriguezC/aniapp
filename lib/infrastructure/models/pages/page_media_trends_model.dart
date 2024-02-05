import 'package:anilistapp/infrastructure/models/media/media.dart';

class PageMediaTrendsModel {
  final List<MediaTrendsModel> mediaTrends;

  PageMediaTrendsModel({
    required this.mediaTrends,
  });

  factory PageMediaTrendsModel.fromJson(Map<String, dynamic> json) {
    return PageMediaTrendsModel(
      mediaTrends: (json['mediaTrends'] as List)
          .map((e) => MediaTrendsModel.fromJson(e))
          .toList(),
    );
  }
}
