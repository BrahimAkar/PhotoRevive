class AiModel {
  final String id;
  final String name;
  final String description;
  final String imageBefore;
  final String imageAfter;
  final List<AiModelMainFeature> mainFeatures;

  AiModel(
    this.id,
    this.name,
    this.description,
    this.imageBefore,
    this.imageAfter,
    this.mainFeatures,
  );
}

class AiModelMainFeature {
  final String mainFeatureTitle;
  final String mainFeatureIcon;

  AiModelMainFeature(
    this.mainFeatureTitle,
    this.mainFeatureIcon,
  );
}
