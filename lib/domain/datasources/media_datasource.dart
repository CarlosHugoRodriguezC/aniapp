import 'package:anilistapp/domain/entities/media_entity.dart';

abstract class MediaDatasource {
  Future<List<MediaEntity>> getMediaList();
  Future<List<MediaEntity>> getMediaTrending();
  Future<MediaEntity> getMedia(int id);
  Future<MediaEntity> getPopularMediaOfYear(int year);
}
