class CharacterEntity {
  final String name;
  final String nativeName;
  final String image;
  final String age;
  final String gender;
  final String siteUrl;

  CharacterEntity({
    required this.name,
    required this.nativeName,
    required this.image,
    required this.age,
    required this.gender,
    required this.siteUrl,
  });

  CharacterEntity copyWith({
    String? name,
    String? nativeName,
    String? image,
    String? age,
    String? gender,
    String? siteUrl,
  }) {
    return CharacterEntity(
      name: name ?? this.name,
      nativeName: nativeName ?? this.nativeName,
      image: image ?? this.image,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      siteUrl: siteUrl ?? this.siteUrl,
    );
  }

  @override
  String toString() =>
      'CharacterEntity(name: $name, nativeName: $nativeName, image: $image, age: $age,)';
}
