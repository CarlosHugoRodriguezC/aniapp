import 'package:anilistapp/infrastructure/models/json_serializable/json_serializable_model.dart';

class GraphDataModel<T extends JsonSerializableModel>
    extends JsonSerializableModel {
  final T data;

  GraphDataModel({
    required this.data,
  });

  @override
  factory GraphDataModel.fromJson(Map<String, dynamic> json) {
    return GraphDataModel(
      data: (T as JsonSerializableModel).fromJson(json['data']) as T,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}
