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
FutureOr<HomeListsEntity> getHomeMediaLists(GetHomeMediaListsRef ref) async {
  final repository = ref.watch(getMediaRepositoryProvider);

  // await Future.delayed(const Duration(seconds: 2));

  final (homeLists, message) = await repository.getHomeMediaLists();

  if (homeLists == null) {
    throw Exception(message ?? 'Error getting home media lists');
  }

  return homeLists;
}

@riverpod
FutureOr<MediaEntity> getTheMostPopularMedia(
  GetTheMostPopularMediaRef ref,
) async {
  final homeLists = await ref.watch(getHomeMediaListsProvider.future);
  return homeLists.seasonalMedia.first;
}

@riverpod
Future<List<MediaEntity>> getMediaList(GetMediaListRef ref) async {
  final mediaRepository = ref.watch(getMediaRepositoryProvider);

  final (mediaList, message) = await mediaRepository.getMediaList();

  if (mediaList == null) {
    throw Exception(message ?? 'Error getting media list');
  }

  return mediaList;
}

@riverpod
Future<List<MediaEntity>> getMediaTrends(GetMediaTrendsRef ref) async {
  final repository = ref.watch(getMediaRepositoryProvider);

  final (mediaList, message) = await repository.getMediaTrending();

  if (mediaList == null) {
    throw Exception(message ?? 'Error getting media trends');
  }

  return mediaList;
}

@riverpod
Future<MediaEntity> getMediaPopularOfSeasonYear(
    GetMediaPopularOfSeasonYearRef ref) async {
  final repository = ref.watch(getMediaRepositoryProvider);

  final (media, message) =
      await repository.getPopularMediaOfYear(DateTime.now().year);

  if (media == null) {
    throw Exception(message ?? 'Error getting popular media of year');
  }

  return media;
}

@riverpod
FutureOr<MediaEntity> getMediaById(GetMediaByIdRef ref, int id) async {
  final repository = ref.watch(getMediaRepositoryProvider);

  final (media, message) = await repository.getMedia(id);

  if (media == null) {
    throw Exception(message ?? 'Error getting media by id');
  }

  return media;
}
