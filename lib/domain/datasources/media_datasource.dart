import 'package:anilistapp/domain/entities/media_entity.dart';

abstract class MediaDatasource {
  Future<List<MediaEntity>> getMediaList();
  Future<MediaEntity> getMedia(int id);
}
