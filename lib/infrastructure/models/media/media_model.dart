import 'package:anilistapp/infrastructure/infrastructure.dart';
import 'package:anilistapp/infrastructure/models/character/character_model.dart';

class MediaModel {
  final int id;
  final MediaTitle title;
  final MediaCoverImage coverImage;
  final String bannerImage;
  final String description;
  final int averageScore;
  final List<String> genres;
  final List<CharacterModel>? characters;
  final MediaTrailer? trailer;

  MediaModel({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.bannerImage,
    required this.description,
    required this.averageScore,
    required this.genres,
    this.characters = const [],
    this.trailer,
  });

  factory MediaModel.fromJson(Map<String, dynamic> json) {
    return MediaModel(
      id: json['id'],
      title: MediaTitle.fromJson(json['title']),
      coverImage: MediaCoverImage.fromJson(json['coverImage']),
      bannerImage: json['bannerImage'] ?? 'https://via.placeholder.com/150',
      description: json['description'] ?? 'No description',
      averageScore: json['averageScore'] ?? 0,
      genres: ((json['genres'] ?? []) as List<dynamic>)
          .map((genre) => genre as String)
          .toList(),
      characters: ((json['characters']?['nodes'] ?? []) as List<dynamic>)
          .map((character) => CharacterModel.fromJson(character))
          .toList(),
      trailer: json['trailer'] != null
          ? MediaTrailer.fromJson(json['trailer'])
          : null,
    );
  }

  @override
  String toString() {
    return 'MediaModel(id: $id, title: $title, coverImage: $coverImage, bannerImage: $bannerImage, description: $description, averageScore: $averageScore, genres: $genres, characters: $characters, trailer: $trailer)';
  }
}

class MediaCoverImage {
  final String color;
  final String large;
  final String medium;
  final String extraLarge;

  MediaCoverImage({
    required this.color,
    required this.large,
    required this.medium,
    required this.extraLarge,
  });

  factory MediaCoverImage.fromJson(Map<String, dynamic> json) {
    return MediaCoverImage(
      color: json['color'] ?? "0x000000",
      large: json['large'] ?? 'https://via.placeholder.com/150',
      medium: json['medium'] ?? 'https://via.placeholder.com/150',
      extraLarge: json['extraLarge'] ?? 'https://via.placeholder.com/150',
    );
  }

  @override
  String toString() {
    return 'MediaCoverImage(color: $color, large: $large, medium: $medium, extraLarge: $extraLarge)';
  }
}

class MediaTitle {
  final String romaji;
  final String english;
  final String native;

  MediaTitle({
    required this.romaji,
    required this.english,
    required this.native,
  });

  factory MediaTitle.fromJson(Map<String, dynamic> json) {
    return MediaTitle(
      romaji: json['romaji'] ?? "No Romaji title",
      english: json['english'] ?? 'No English title',
      native: json['native'] ?? 'No native title',
    );
  }

  @override
  String toString() =>
      'MediaTitle(romaji: $romaji, english: $english, native: $native)';
}

class MediaTrailer {
  MediaTrailer({
    required this.id,
    required this.site,
    required this.thumbnail,
  });

  factory MediaTrailer.fromJson(Map<String, dynamic> json) {
    return MediaTrailer(
      id: json['id'] ?? '',
      site: json['site'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  final String id;
  final String site;
  final String thumbnail;

  @override
  String toString() =>
      'MediaTrailerModel(id: $id, site: $site, thumbnail: $thumbnail)';
}
