import 'package:photo_revive/app/extensions.dart';
import 'package:photo_revive/app/resources/strings_manager.dart';
import 'package:photo_revive/data/responses/responses.dart';
import 'package:photo_revive/domain/models/ai_model.dart';
import 'package:photo_revive/domain/models/home_models.dart';

extension HomeResponseMapper on HomeResponse {
  HomeObject toDomain() {
    return HomeObject(
      models?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension AiModelResponseMapper on AiModelResponse {
  AiModel toDomain() {
    return AiModel(
      id.orEmpty(),
      name.orEmpty(),
      description.orEmpty(),
      imageBefore.orEmpty(),
      imageAfter.orEmpty(),
      mainFeatures?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension AiModelMainFeatureResponseMapper on AiModelMainFeatureResponse {
  AiModelMainFeature toDomain() {
    return AiModelMainFeature(
      mainFeatureTitle.orEmpty(),
      mainFeatureDescription.orEmpty(),
    );
  }
}
