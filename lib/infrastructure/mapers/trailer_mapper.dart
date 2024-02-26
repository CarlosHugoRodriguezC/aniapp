import 'package:anilistapp/domain/domain.dart';
import 'package:anilistapp/infrastructure/infrastructure.dart';

class MediaTrailerMapper {
  static TrailerEntity modelToEntity(MediaTrailer model) {
    return TrailerEntity(
      id: model.id,
      site: model.site,
      thumbnail: model.thumbnail,
    );
  }
}
