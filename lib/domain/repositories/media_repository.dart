import 'package:anilistapp/domain/entities/media_entity.dart';

abstract class MediaRepository {
  Future<List<MediaEntity>> getMediaList();
  Future<MediaEntity> getMedia(int id);
}
