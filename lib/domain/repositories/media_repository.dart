import 'package:anilistapp/domain/entities/entities.dart';

abstract class MediaRepository {
  Future<(HomeListsEntity? homeLists, String? message)> getHomeMediaLists();
  Future<(List<MediaEntity>? media, String? message)> getMediaList();
  Future<(List<MediaEntity>? media, String? message)> getMediaTrending();
  Future<(MediaEntity? media, String? message)> getMedia(int id);
  Future<(MediaEntity? media, String? message)> getPopularMediaOfYear(int year);
}
