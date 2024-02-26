class TrailerEntity {
  TrailerEntity({
    required this.id,
    required this.site,
    required this.thumbnail,
  });

  final String id;
  final String site;
  final String thumbnail;

  TrailerEntity copyWith({
    String? id,
    String? site,
    String? thumbnail,
  }) {
    return TrailerEntity(
      id: id ?? this.id,
      site: site ?? this.site,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  String toString() =>
      'TrailerEntity(id: $id, site: $site, thumbnail: $thumbnail)';
}
