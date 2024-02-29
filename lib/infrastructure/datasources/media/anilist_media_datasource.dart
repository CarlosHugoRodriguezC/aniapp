import 'package:anilistapp/domain/datasources/media_datasource.dart';
import 'package:anilistapp/domain/entities/home_lists_entity.dart';
import 'package:anilistapp/domain/entities/media_entity.dart';
import 'package:anilistapp/infrastructure/mapers/media_mapper.dart';
import 'package:anilistapp/infrastructure/models/models.dart';
import 'package:anilistapp/infrastructure/queries/media/media_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AnilistMediaDatasource implements MediaDatasource {
  AnilistMediaDatasource({
    required this.client,
  });

  final GraphQLClient client;

  @override
  Future<(HomeListsEntity?, String?)> getHomeMediaLists() async {
    final currentYear = DateTime.now().year;
    final options = QueryOptions(
      document: gql(MediaQueries.homeMediaQuery),
      variables: {
        'type': "ANIME",
        'season': "WINTER",
        'seasonYear': currentYear,
        'nextSeason': "SPRING",
        'nextYear': currentYear,
      },
    );

    final response = await client.query(options);

    if (response.hasException) {
      return (null, response.exception.toString());
    }

    if (response.data == null) {
      return (null, 'No data found');
    }

    final trendingMedia =
        (response.data!['trending']['media'] as List<dynamic>).map(
      (media) => MediaModel.fromJson(media),
    );

    final seasonalMedia =
        (response.data!['season']['media'] as List<dynamic>).map(
      (media) => MediaModel.fromJson(media),
    );

    final nextSeasonMedia =
        (response.data!['nextSeason']['media'] as List<dynamic>).map(
      (media) => MediaModel.fromJson(media),
    );

    final popularMedia =
        (response.data!['popular']['media'] as List<dynamic>).map(
      (media) => MediaModel.fromJson(media),
    );

    final topMedia = (response.data!['top']['media'] as List<dynamic>).map(
      (media) => MediaModel.fromJson(media),
    );

    final homeListEntity = HomeListsEntity(
      trendingMedia: trendingMedia
          .map((model) => MediaMapper.modelToEntity(model))
          .toList(),
      seasonalMedia: seasonalMedia
          .map((model) => MediaMapper.modelToEntity(model))
          .toList(),
      nextSeasonMedia: nextSeasonMedia
          .map((model) => MediaMapper.modelToEntity(model))
          .toList(),
      popularMedia: popularMedia
          .map((model) => MediaMapper.modelToEntity(model))
          .toList(),
      topMedia:
          topMedia.map((model) => MediaMapper.modelToEntity(model)).toList(),
    );

    return (homeListEntity, null);
  }

  @override
  Future<(MediaEntity?, String?)> getMedia(int id) {
    final options = QueryOptions(
      document: gql(MediaQueries.mediaByIdQuery),
      variables: {
        'id': id,
      },
    );

    return client.query(options).then((response) {
      if (response.hasException) {
        return (null, response.exception.toString());
      }

      if (response.data == null) {
        return (null, 'No data found');
      }

      final media = MediaModel.fromJson(response.data!['Media']);

      return (MediaMapper.modelToEntity(media), null);
    });
  }

  @override
  Future<(List<MediaEntity>?, String?)> getMediaList() {
    // TODO: implement getMediaList
    throw UnimplementedError();
  }

  @override
  Future<(List<MediaEntity>?, String?)> getMediaTrending() {
    // TODO: implement getMediaTrending
    throw UnimplementedError();
  }

  @override
  Future<(MediaEntity?, String?)> getPopularMediaOfYear(int year) {
    // TODO: implement getPopularMediaOfYe
    throw UnimplementedError();
  }
}
