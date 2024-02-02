abstract class JsonSerializableModel {
  Map<String, dynamic> toJson();
  JsonSerializableModel fromJson(Map<String, dynamic> json) =>
      throw UnimplementedError();
}


mixin Deserializable<T> {
  T fromJson(Map<String, dynamic> json);
}