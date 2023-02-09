// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

AiModelMainFeatureResponse _$AiModelMainFeatureResponseFromJson(
        Map<String, dynamic> json) =>
    AiModelMainFeatureResponse(
      json['mainFeatureTitle'] as String,
      json['mainFeatureDescription'] as String,
    );

Map<String, dynamic> _$AiModelMainFeatureResponseToJson(
        AiModelMainFeatureResponse instance) =>
    <String, dynamic>{
      'mainFeatureTitle': instance.mainFeatureTitle,
      'mainFeatureDescription': instance.mainFeatureDescription,
    };

AiModelResponse _$AiModelResponseFromJson(Map<String, dynamic> json) =>
    AiModelResponse(
      json['id'] as String,
      json['name'] as String,
      json['description'] as String,
      json['imageBefore'] as String,
      json['imageAfter'] as String,
      (json['mainFeatures'] as List<dynamic>)
          .map((e) =>
              AiModelMainFeatureResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AiModelResponseToJson(AiModelResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageBefore': instance.imageBefore,
      'imageAfter': instance.imageAfter,
      'mainFeatures': instance.mainFeatures,
    };

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      (json['models'] as List<dynamic>)
          .map((e) => AiModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'models': instance.models,
    };
