import 'package:anilistapp/domain/datasources/media_datasource.dart';
import 'package:anilistapp/domain/entities/media_entity.dart';
import 'package:anilistapp/infrastructure/mapers/media_mapper.dart';
import 'package:anilistapp/infrastructure/models/media/media_page_response_model.dart';
import 'package:anilistapp/infrastructure/models/media/media_page_trending_response_model.dart';
import 'package:anilistapp/infrastructure/queries/media/media_queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AnilistMediaDatasource implements MediaDatasource {
  AnilistMediaDatasource({
    required this.client,
  });

  final GraphQLClient client;

  @override
  Future<MediaEntity> getMedia(int id) {
    throw UnimplementedError();
  }

  @override
  Future<List<MediaEntity>> getMediaList() async {
    final options = QueryOptions(
      document: gql(
        MediaQueries.getMediaPageQuery(1, 10),
      ),
    );

    try {
      final result = await client.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final response = MediaPageResponseModel.fromJson(result.data!);

      return response.page.media
          .map((m) => MediaMapper.mapToEntity(m))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<MediaEntity>> getMediaTrending() async {
    final options = QueryOptions(
      document: gql(
        MediaQueries.getMediaPageTrendingQuery(1, 10),
      ),
    );

    try {
      final result = await client.query(options);

      if (result.hasException) {
        throw Exception(result.exception.toString());
      }

      final response = MediaPageTrendingResponseModel.fromJson(result.data!);

      return response.page.mediaTrending
          .map((m) => MediaMapper.mapToEntity(m.media))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
