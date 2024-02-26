import 'package:anilistapp/domain/domain.dart';
import 'package:anilistapp/infrastructure/infrastructure.dart';

class CharacterMapper {
  static CharacterEntity modelToEntity(CharacterModel characterModel) {
    return CharacterEntity(
      name: characterModel.name.full,
      nativeName: characterModel.name.native,
      image: characterModel.image.large,
      age: characterModel.age ?? 'No age found',
      gender: characterModel.gender ?? 'No gender found',
      siteUrl: characterModel.siteUrl,
    );
  }
}
