import 'package:anilistapp/domain/domain.dart';

class MediaRepositoryImpl extends MediaRepository {
  final MediaDatasource _mediaDatasource;

  MediaRepositoryImpl(this._mediaDatasource);

  @override
  Future<List<MediaEntity>> getMediaList() {
    return _mediaDatasource.getMediaList();
  }

  @override
  Future<MediaEntity> getMedia(int id) {
    return _mediaDatasource.getMedia(id);
  }
}
