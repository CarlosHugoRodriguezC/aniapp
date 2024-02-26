import 'package:anilistapp/domain/entities/media_entity.dart';
import 'package:anilistapp/infrastructure/infrastructure.dart';
import 'package:anilistapp/infrastructure/mapers/character_mapper.dart';
import 'package:anilistapp/infrastructure/models/media/media_model.dart';

class MediaMapper {
  static MediaEntity modelToEntity(MediaModel mediaModel) {
    return MediaEntity(
      id: mediaModel.id,
      title: mediaModel.title.romaji,
      coverImage: mediaModel.coverImage.extraLarge,
      bannerImage: mediaModel.bannerImage,
      description: mediaModel.description,
      score: mediaModel.averageScore.toDouble(),
      genres: mediaModel.genres,
      characters: mediaModel.characters
          ?.map(
            (character) => CharacterMapper.modelToEntity(character),
          )
          .toList(),
      trailer: mediaModel.trailer != null
          ? MediaTrailerMapper.modelToEntity(mediaModel.trailer!)
          : null,
    );
  }
}
