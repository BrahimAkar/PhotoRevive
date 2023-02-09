// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class AiModelMainFeatureResponse {
  @JsonKey(name: "mainFeatureTitle")
  final String? mainFeatureTitle;
  @JsonKey(name: "mainFeatureDescription")
  final String? mainFeatureDescription;

  AiModelMainFeatureResponse(
      this.mainFeatureTitle, this.mainFeatureDescription);

  // tojson
  factory AiModelMainFeatureResponse.fromJson(Map<String, dynamic> json) =>
      _$AiModelMainFeatureResponseFromJson(json);

  // fromjson
  Map<String, dynamic> toJson() => _$AiModelMainFeatureResponseToJson(this);
}

@JsonSerializable()
class AiModelResponse {
  @JsonKey(name: "id")
  final String? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "imageBefore")
  final String? imageBefore;
  @JsonKey(name: "imageAfter")
  final String? imageAfter;
  @JsonKey(name: "mainFeatures")
  final List<AiModelMainFeatureResponse>? mainFeatures;

  AiModelResponse(this.id, this.name, this.description, this.imageBefore,
      this.imageAfter, this.mainFeatures);
  // tojson
  factory AiModelResponse.fromJson(Map<String, dynamic> json) =>
      _$AiModelResponseFromJson(json);

  // fromjson
  Map<String, dynamic> toJson() => _$AiModelResponseToJson(this);
}

@JsonSerializable()
class HomeResponse extends BaseResponse {
  @JsonKey(name: "models")
  final List<AiModelResponse>? models;

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  HomeResponse(this.models);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}
