import 'package:anilistapp/domain/datasources/media_datasource.dart';
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
  Future<MediaEntity> getMedia(int id) async {
    final options = QueryOptions(
      document: gql(
        MediaQueries.mediaByIdQuery,
      ),
      variables: {
        'id': id,
      },
    );

    try {
      final result = await client.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final response = MediaModel.fromJson(result.data!['Media']);
      return MediaMapper.modelToEntity(response);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getMediaList() async {
    final options = QueryOptions(
      document: gql(
        MediaQueries.pageMediaQuery,
      ),
      variables: {
        'page': 1,
        'perPage': 10,
        'year': DateTime.now().year,
      },
    );

    try {
      final result = await client.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final response = PageMediaModel.fromJson(result.data!['Page']);

      return response.media.map((m) => MediaMapper.modelToEntity(m)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getMediaTrending() async {
    final options = QueryOptions(
      document: gql(
        MediaQueries.pageMediaTrendingQuery,
      ),
      variables: {
        'page': 1,
        'perPage': 10,
        'year': DateTime.now().year,
      },
    );

    try {
      final result = await client.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final response = PageMediaTrendsModel.fromJson(result.data!['Page']);

      return response.mediaTrends
          .map((m) => MediaMapper.modelToEntity(m.media))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<MediaEntity> getPopularMediaOfYear(int year) async {
    final options = QueryOptions(
      document: gql(
        MediaQueries.popularMediaOfSeasonYearQuery,
      ),
      variables: {
        'year': year,
        'mediaType': 'ANIME',
        'format': 'TV',
      },
    );

    try {
      final result = await client.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final response = MediaModel.fromJson(result.data!['Media']);

      return MediaMapper.modelToEntity(response);
    } catch (e) {
      rethrow;
    }
  }
}
