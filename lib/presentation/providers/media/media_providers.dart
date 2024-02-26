import 'package:anilistapp/config/plugins/graphql_plugin.dart';
import 'package:anilistapp/domain/domain.dart';
import 'package:anilistapp/infrastructure/infrastructure.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'media_providers.g.dart';

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

@riverpod
Future<List<MediaEntity>> getMediaTrends(GetMediaTrendsRef ref) async {
  final repository = ref.watch(getMediaRepositoryProvider);

  final result = await repository.getMediaTrending();

  return result;
}

@riverpod
Future<MediaEntity> getMediaPopularOfSeasonYear(
    GetMediaPopularOfSeasonYearRef ref) async {
  final repository = ref.watch(getMediaRepositoryProvider);

  final result = await repository.getPopularMediaOfYear(DateTime.now().year);

  return result;
}

@riverpod
FutureOr<MediaEntity> getMediaById(GetMediaByIdRef ref, int id) async {
  final repository = ref.watch(getMediaRepositoryProvider);

  final result = await repository.getMedia(id);

  print('result: $result');

  return result;
}
