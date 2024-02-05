class MediaModel {
  final int id;
  final MediaTitle title;
  final MediaCoverImage coverImage;
  final String bannerImage;
  final String description;
  final int averageScore;
  final List<String> genres;

  MediaModel({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.bannerImage,
    required this.description,
    required this.averageScore,
    required this.genres,
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
    );
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
      romaji: json['romaji'],
      english: json['english'] ?? 'No English title',
      native: json['native'] ?? 'No native title',
    );
  }
}
