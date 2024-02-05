class MediaEntity {
  MediaEntity({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.bannerImage,
    required this.description,
    required this.score,
    required this.genres,
  });

  final int id;
  final String title;
  final String coverImage;
  final String bannerImage;
  final String description;
  final double score;
  final List<String> genres;

  MediaEntity copyWith({
    int? id,
    String? title,
    String? coverImage,
    String? bannerImage,
    String? description,
    double? score,
    List<String>? genres,
  }) =>
      MediaEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        coverImage: coverImage ?? this.coverImage,
        bannerImage: bannerImage ?? this.bannerImage,
        description: description ?? this.description,
        score: score ?? this.score,
        genres: genres ?? this.genres,
      );

  @override
  String toString() {
    return 'MediaEntity(id: $id, title: $title, coverImage: $coverImage, bannerImage: $bannerImage, description: $description, score: $score, genres: $genres)';
  }
}
