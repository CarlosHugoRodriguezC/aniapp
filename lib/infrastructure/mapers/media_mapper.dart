import 'package:anilistapp/domain/entities/media_entity.dart';
import 'package:anilistapp/infrastructure/models/media/media_model.dart';

class MediaMapper {
  static MediaEntity mapToEntity(MediaModel mediaModel) {
    return MediaEntity(
      id: mediaModel.id,
      title: mediaModel.title.romaji,
      coverImage: mediaModel.coverImage.extraLarge,
      bannerImage: mediaModel.bannerImage ?? 'https://via.placeholder.com/150',
      description: mediaModel.description,
      score: mediaModel.averageScore.toDouble(),
    );
  }
}
