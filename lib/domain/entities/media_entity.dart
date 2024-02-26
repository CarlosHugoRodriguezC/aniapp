import 'package:anilistapp/domain/domain.dart';

class MediaEntity {
  MediaEntity({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.bannerImage,
    required this.description,
    required this.score,
    required this.genres,
    this.characters,
    this.trailer,
  });

  final int id;
  final String title;
  final String coverImage;
  final String bannerImage;
  final String description;
  final double score;
  final List<String> genres;
  final List<CharacterEntity>? characters;
  final TrailerEntity? trailer;

  MediaEntity copyWith({
    int? id,
    String? title,
    String? coverImage,
    String? bannerImage,
    String? description,
    double? score,
    List<String>? genres,
    List<CharacterEntity>? characters,
    TrailerEntity? trailer,
  }) =>
      MediaEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        coverImage: coverImage ?? this.coverImage,
        bannerImage: bannerImage ?? this.bannerImage,
        description: description ?? this.description,
        score: score ?? this.score,
        genres: genres ?? this.genres,
        characters: characters ?? this.characters,
        trailer: trailer ?? this.trailer,
      );

  @override
  String toString() {
    return 'MediaEntity(id: $id, title: $title, coverImage: $coverImage, bannerImage: $bannerImage, description: $description, score: $score, genres: $genres, characters: $characters, trailer: $trailer)';
  }
}
