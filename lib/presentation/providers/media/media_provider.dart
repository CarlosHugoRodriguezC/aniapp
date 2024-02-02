import 'package:anilistapp/config/plugins/graphql_plugin.dart';
import 'package:anilistapp/domain/domain.dart';
import 'package:anilistapp/infrastructure/datasources/media/anilist_media_datasource.dart';
import 'package:anilistapp/infrastructure/repositories/media_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media_provider.g.dart';

@riverpod
MediaRepository getMediaRepository(GetMediaRepositoryRef ref) {
  return MediaRepositoryImpl(
    AnilistMediaDatasource(client: GraphqlPlugin().client!.value),
  );
}

@riverpod
Future<List<MediaEntity>> getMediaList(GetMediaListRef ref) async {
  final mediaRepository = ref.watch(getMediaRepositoryProvider);

  final result = await mediaRepository.getMediaList();

  return result;
}
