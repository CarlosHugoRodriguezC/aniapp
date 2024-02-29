import 'package:anilistapp/domain/domain.dart';

class MediaRepositoryImpl extends MediaRepository {
  final MediaDatasource _mediaDatasource;

  MediaRepositoryImpl(this._mediaDatasource);

  @override
  Future<(HomeListsEntity?, String?)> getHomeMediaLists() {
    return _mediaDatasource.getHomeMediaLists();
  }

  @override
  Future<(MediaEntity?, String?)> getMedia(int id) {
    return _mediaDatasource.getMedia(id);
  }

  @override
  Future<(List<MediaEntity>?, String?)> getMediaList() {
    return _mediaDatasource.getMediaList();
  }

  @override
  Future<(List<MediaEntity>?, String?)> getMediaTrending() {
    return _mediaDatasource.getMediaTrending();
  }

  @override
  Future<(MediaEntity?, String?)> getPopularMediaOfYear(int year) {
    return _mediaDatasource.getPopularMediaOfYear(year);
  }
}
