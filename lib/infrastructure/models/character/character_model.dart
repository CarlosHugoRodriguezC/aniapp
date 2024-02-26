class CharacterModel {
  final int id;
  final CharacterName name;
  final CharacterImage image;
  final String? age;
  final String? gender;
  final String siteUrl;

  CharacterModel({
    required this.id,
    required this.name,
    required this.image,
    required this.age,
    required this.gender,
    required this.siteUrl,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: CharacterName.fromJson(json['name'] ?? []),
        image: CharacterImage.fromJson(json['image'] ?? []),
        age: json['age'] ?? 'No age found',
        gender: json['gender'] ?? 'No gender found',
        siteUrl: json['siteUrl'] ?? 'No site url found',
      );
}

class CharacterImage {
  final String large;
  final String medium;

  CharacterImage({
    required this.large,
    required this.medium,
  });

  factory CharacterImage.fromJson(Map<String, dynamic> json) => CharacterImage(
        large: json['large'] ?? 'https://via.placeholder.com/150',
        medium: json['medium'] ?? 'https://via.placeholder.com/150',
      );
}

class CharacterName {
  final String native;
  final String full;

  CharacterName({
    required this.native,
    required this.full,
  });

  factory CharacterName.fromJson(Map<String, dynamic> json) => CharacterName(
        native: json['native'] ?? 'No native name found',
        full: json['full'] ?? 'No full name found',
      );
}
