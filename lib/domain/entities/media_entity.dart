class MediaEntity {
  MediaEntity({
    required this.id,
    required this.title,
    required this.coverImage,
    required this.bannerImage,
    required this.description,
    required this.score,
  });

  final int id;
  final String title;
  final String coverImage;
  final String bannerImage;
  final String description;
  final double score;

  MediaEntity copyWith({
    int? id,
    String? title,
    String? coverImage,
    String? bannerImage,
    String? description,
    double? score,
  }) =>
      MediaEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        coverImage: coverImage ?? this.coverImage,
        bannerImage: bannerImage ?? this.bannerImage,
        description: description ?? this.description,
        score: score ?? this.score,
      );

  @override
  String toString() {
    return 'MediaEntity(id: $id, title: $title, coverImage: $coverImage, bannerImage: $bannerImage, description: $description)';
  }
}
